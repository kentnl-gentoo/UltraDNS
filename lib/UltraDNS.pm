package UltraDNS;

# TODO:
# decide on input&output type handling (integration with RPC::XML::*?)
# consider return types (currently uses RPC::XML ref-to-scalar)
# add UltraDNS specific types
# tests covering all arg types and main return types
# test coverage
# consider potential encoding issues
# docs
# perltidy & optimize

use warnings;
use strict;
use Carp;

=head1 NAME

UltraDNS - Client API for the NeuStar UltraDNS Transaction Protocol

=head1 SYNOPSIS

    use UltraDNS;

    # establish a secure connection
    my $udns = UltraDNS->connect("$host:$port", $sponsor, $username, $password);

    # Queue up one or more actions to be performed
    $udns->CreateARecord($zone);
    $udns->CreateCNAMERecord($zone);

    # Send actions as a single transaction
    $udns->commit(...); # throws exception on error

    # queue up and commit more requests on the same connection

Getting multiple results:

    # Actions can return results. Each return value is a reference
    # to where the result will be stored when commit() is called.
    $result_ref1 = $udns->GetZoneInfo($zone);
    $result_ref2 = $udns->GetMXRecordsOfZone($zone);

    $udns->commit(...);

    # $result_ref values above now refer to the results for each method

Getting a single result:

    # utility method that calls commit and returns the dereferenced result
    $result = $udns->do( ...some method that queues a request... );

    $result = $udns->do( $udns->AutoSerialUpdateState );
    # $result is either 1 or 0


=head1 DESCRIPTION

A simple and efficient client for the NeuStar UltraDNS Transaction Protocol as
defined in L<http://www.ultradns.net/api/NUS_API_XML.pdf> (version 3.0, dated
September 5, 2008),

All requests are batched and performed in transactions.  A single secure
connection is established and reused for any number of transactions.

All errors are reported via exceptions.

=head2 STATUS

All methods are supported, though currently some data types don't work.
The handling of results and non-scalar arguments is likely to change.

Experimentation and feedback are encouraged.

=head1 METHODS

=cut

use Symbol qw(gensym);
use Data::Dumper;
use IO::Socket::INET;
use Net::SSLeay qw(die_now die_if_ssl_error);
use RPC::XML::Parser;

use UltraDNS::Type;
use UltraDNS::Methods;

our $VERSION = '0.01';

my $xml_rpc_parser = RPC::XML::Parser->new();


Net::SSLeay::load_error_strings();
Net::SSLeay::SSLeay_add_ssl_algorithms();
Net::SSLeay::randomize();


=head2 connect

  $udns = UltraDNS->connect($host_and_port, $sponsor, $username, $password, $attr);

Establish a secure C<https> connection to the specified UltraDNS host and port,
and login using the specified $sponsor, $username, $password.

Returns an C<UltraDNS> object.  Throws an exception on error.

The optional $attr parameter is a reference to a hash of attributes:

=over 4

=item trace

Specifies the integer trace (debug) level. 0 for none, 1 for basic tracing, and
2 and above for more detailed, and more verbose, tracing. Trace messages are
output via C<warn>.

=item ssl_trace

Sets $Net::SSLeay::trace. 0=no warns, 1=only errors, 2=ciphers, 3=progress, 4=dump data.
See L<Net::SSLeay> for more information.

=item version

Specifies the protocol version argument value used in the C<UDNS_OpenConnection> request.

=back

See L<UltraDNS::Methods> for a list of the UltraDNS Transaction Protocol
methods you can call once a connection is established.

=cut

sub connect {   ## no critic (ProhibitBuiltinHomonyms)
    my ($class, $host_and_port, $sponsor, $username, $password, $attr) = @_;
    $host_and_port ||= "api.ultradns.net:8755";

    my $version = $attr->{version} || '3.0';

    # create an underlying raw socket and connect it to the UltraDNS server
    my $socket = IO::Socket::INET->new(PeerAddr => $host_and_port)
        or croak ("Error connecting to $host_and_port: $!");

    # create a new SSL instance and link it to the socket
    $Net::SSLeay::trace = $attr->{ssl_trace} if $attr->{ssl_trace};
    my $ctx = Net::SSLeay::CTX_new() or die_now("Failed to create SSL_CTX $!");
    my $ssl = Net::SSLeay::new($ctx) or die_now("Failed to create SSL $!");
    Net::SSLeay::set_fd($ssl, fileno($socket));   # Must use fileno

    # connect and negotiate at the SSL level
    my $resp = Net::SSLeay::connect($ssl);
    die_if_ssl_error("SSL connect failed");

    my $self = bless {
        peer_addr => $host_and_port,
        user  => $username,
        fh    => $socket, # just to hold ref to underlying socket
        ssl   => $ssl,
        queue => [],
        trace => $attr->{trace} || $ENV{ULTRADNS_TRACE} || 0,
    } => $class;

    $self->_send_xml( join "",
        "<?xml version=\"1.0\"?>",
        "<session>",
    ); # no reply at this point

    $self->OpenConnection($sponsor, $username, $password, $version);
    $self->NoAutoCommit(); # for transaction safety

    my $commit = $self->commit;
    $self->_error("Initial setup failed: $$commit")
        unless $$commit eq 'Transaction succeeded';

    return $self;
}

sub DESTROY {
    # nothing extra needed, just let perl look after it
}


=head2 commit

  $udns->commit;

Submits the queued requests. An exception is thown on error.

=cut

sub commit {
    my ($self) = @_;

    my $queue = $self->{queue};
    $self->{queue} = []; # reset the queue in the object

    $self->_trace(sprintf "committing %d requests (+1 transaction)", scalar @$queue);

    my $xml = join "\n", map { $_->{xml} } @$queue;
    $self->_send_xml( "<transaction>\n$xml</transaction>\n" );

    my $responses = $self->_get_responses;

    # Shift the @$responses into the result slots in @$queue.
    # We expect one more item in @$responses than @$queue because @$responses
    # should have an extra 'Transaction succeeded' at the end.
    while (@$queue) {
        croak "Didn't get responses for all methods in transaction"
            if @$responses == 0;
        my $slot     = shift @$queue;
        my $response = shift @$responses;
        if ($response->is_fault) {
            my $fault = $response->value;
            $self->_error(sprintf "%s failed with error %s: %s",
                $slot->{method}, $fault->code, $fault->string);
        }
        $slot->{result} = $response->value;
    }
    my $response = shift @$responses;
    $self->_error(sprintf "commit failed with error %s: %s", $response->code, $response->string)
        if $response->is_fault;
    $self->_error("Unexpected extra responses after commit")
        if @$responses;

    return $response->value;
}


=head2 rollback

  $udns->rollback;

Discards the queued requests.

=cut

sub rollback {
    shift->{queue} = [];
    return;
}


=head2 do

  $result = $udns->do( $udns->SomeMethodThatReturnsAResult(...) );

A convienience method that calls commit() and returns the de-referenced
argument. The one-line call has the same effect as these three lines:

  $result_ref = $udns->SomeMethodThatReturnsAResult(...);
  $udns->commit;
  $result = $$result_ref; # de-reference to get return value

but is much more convienient when you just want to get a value from the server.

Multiple calls can be combined into a single request like this:

  my ($a, $b, $c) = $udns->do(
      $udns->MethodReturningA(...),
      $udns->MethodReturningB(...),
      $udns->MethodReturningC(...)
  );

=cut

sub do {
    my ($self, @result_refs) = @_;
    my $queue = $self->{queue};

    $self->_error(sprintf "do() called with %d arguments but %d actions are queued",
            scalar @result_refs, scalar @$queue)
        if scalar @result_refs != scalar @$queue;
    $self->_error("do() called in scalar context but with more than one argument")
        if not wantarray and @result_refs > 1;

    $self->commit;

    my @results = map { ($$_)->value } @result_refs;

    return $results[0] if not wantarray;
    return @results;
}


# ---


sub _description {
    my $self = shift;
    return sprintf "UltraDNS %s@%s", $self->{user}, $self->{peer_addr};
}


sub _error {
    my $self = shift;
    $self->_trace("error: @_");
    croak $self->_description . " error: @_";
}
sub _warn  { carp  shift->_description . ": @_\n";     return }
sub _trace { warn  "UltraDNS: @_\n" if shift->{trace}; return }


sub _send_xml {
    my ($self, $xml) = @_;
    $self->_trace("_send_xml $xml") if $self->{trace} >= 2;

    Net::SSLeay::write($self->{ssl}, "$xml\r\n")
        or $self->_error("sending request: $!");

    return;
}


sub _get_xml {
    my $self = shift;

    $self->_trace("_get_xml awaiting response") if $self->{trace} >= 2;

    # if we always use a transaction then we can use </methodResponses> (note the plural)
    # to identify the end of the server response to our request, saving ourselves
    # a whole bunch of headaches and inefficiencies
    my $response_body = Net::SSLeay::ssl_read_until($self->{ssl}, "</methodResponses>");
    $self->_trace(Dumper($response_body)) if $self->{trace} >= 2;

    return $response_body;
}


sub _get_responses {
    my ($self) = @_;

    my $response_body = $self->_get_xml;

    # RPC::XML can't handle the UltraDNS methodResponses (plural)
    # so we chop out and process each individual methodResponse in turn
    my @responses;
    while ($response_body =~ s{(<methodResponse>.*?</methodResponse>)}{}m) {
        my $r = $1;
        my $resp = $xml_rpc_parser->parse($r);
        push @responses, $resp;
        print "XML:  $r:\nPerl: ".Dumper($resp) if $self->{trace} >= 3;
    }

    $self->_error("No responses found in $response_body")
        unless @responses;
    $self->_trace("_get_responses received ".scalar(@responses)." responses")
        if $self->{trace} >= 2;

    # cleanse and sanity check the remaining rump of $response_body
    $response_body =~ s{<\?xml version=".*?"\?>}{};
    $response_body =~ s{\s*<methodResponses>\s*</methodResponses>\s*}{};
    if ($response_body ne '') {
        $self->_warn("Unprocessed remnants in response body: '$response_body'");
    }
    
    return \@responses;
}


sub AUTOLOAD {  ## no critic (RequireArgUnpacking)
    (my $method = our $AUTOLOAD) =~ s/.*::(?:UDNS_)?//;
    my $self = shift;
    return $self->_enqueue_method_call($method, \@_);
}


sub _enqueue_method_call {
    my ($self, $method, $args) = @_;
    $self->_trace("$method");

    my $xml = $self->_xml_for_method_call($method, $args);

    return $self->_enqueue_xml($xml, { method => $method, $args => $args });
}


sub _enqueue_xml {
    my ($self, $xml, $meta) = @_;
    my $queue = $self->{queue};
    push @$queue, { %{ $meta || {} }, xml => $xml, result => undef };
    # return reference to the slot that will hold the result value for this method call
    return \$queue->[-1]{result};
}


sub _xml_for_method_call {
    my ($self, $method, $args) = @_;

    my $method_info = UltraDNS::Methods->_method_spec("UDNS_$method")
        or croak "Can't call unknown method '$method'"; # XXX could allow later

    my $arg_info = $method_info->{arg_info};
    if (@$args < @$arg_info) {
        croak sprintf "%s called with too few parameters (has %d parameters but %d only arguments were given)",
                $method, scalar @$arg_info, scalar @$args;
    }
    if (@$args > @$arg_info) {
        croak sprintf "%s called with too many parameters (has %d parameters but %d arguments were given)",
                $method, scalar @$arg_info, scalar @$args
            unless $method_info->{last_arg_repeats};
        # clone and pad out arg_info with copies of the final arg
        $arg_info = [ @$arg_info ];
        push @$arg_info, $arg_info->[-1] while @$arg_info < @$args;
    }

    my @value_xml;
    for my $arg_info (@$arg_info) {
        my $value = shift @$args;
        my $class = "UltraDNS::Type::$arg_info->{type}";
        my $value_obj = $class->new($value);
        push @value_xml, sprintf "<param><value>%s</value></param>\n",
            $value_obj->as_string;
    }

    return "<methodCall><methodName>UDNS_$method</methodName><params>\n@value_xml</params></methodCall>\n";
}


1;

__END__

=head1 LIMITATIONS

A transaction can only contain 10 requests by default because the UltraDNS
module calls UDNS_NoAutoCommit on connection, to ensure reliability, and
NeuStar impose the 10 requests per transaction limit.  This shouldn't be a
problem in practice because transactions are cheap (since they reuse the same
connection) so you can issue your requests grouped into multiple transactions.

=head1 BUGS

Please report any bugs or feature requests to
C<bug-ultradns@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 AUTHOR

Tim Bunce  C<< <Tim.Bunce@pobox.com> >>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2009, TigerLead.com. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

=cut
