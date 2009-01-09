package UltraDNS::Methods;

=head1 NAME

UltraDNS::Methods - Available UltraDNS Transaction Protocol Methods

=head1 SYNOPSYS

  use UltraDNS;

  $udns = UltraDNS->connect(...);

  $udns->...any of these methods...(...);
  $udns->...any of these methods...(...);
  $udns->...any of these methods...(...);

  $udns->commit;

  $udns->...any of these methods...(...);
  $udns->...any of these methods...(...);
  $udns->...any of these methods...(...);

  $udns->commit;

  # etc

=head1 DESCRIPTION

This module contains details of the UltraDNS methods defined by the UltraDNS
Transaction Protocol documentation.

Refer to L<UltraDNS> for more details.

=head1 METHODS

=cut

use strict;
use warnings;

my $method_spec;

sub _method_spec {
    my ($self, $method_name) = @_;
    return $method_spec->{$method_name};
}

$method_spec = {
  "UDNS_AddMailForward" => {
    "arg_info" => [
      {
        "example" => "emailTo",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "forwardTo",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "domain.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_AddRestrictIPForAllZones" => {
    "arg_info" => [
      {
        "example" => "start_ip",
        "sigil" => "\$",
        "type" => "ip_address"
      },
      {
        "example" => "end_ip",
        "sigil" => "\$",
        "type" => "ip_address"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_AddRestrictIPForZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "start_ip",
        "sigil" => "\$",
        "type" => "ip_address"
      },
      {
        "example" => "end_ip",
        "sigil" => "\$",
        "type" => "ip_address"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_AddUserXInfo" => {
    "arg_info" => [
      {
        "example" => "Username",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "FieldName",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "Value",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_AddWebForward" => {
    "arg_info" => [
      {
        "example" => "requestTo",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "redirectTo",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "forwardType",
        "sigil" => "\$",
        "type" => "unsigned"
      },
      {
        "example" => "domain.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeAliasOfCNAMERecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "alias.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewAlias.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeContentOfTXTRecord " => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "OldContent",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "NewContent",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeEmailOfSOARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "user\@domain.com",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeExpireLimitOfSOARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => 86400,
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeHostOfAAAARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "IPAddress",
        "sigil" => "\$",
        "type" => "ipv6_address"
      },
      {
        "example" => "NewHostname.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeHostOfARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "1.1.1.1",
        "sigil" => "\$",
        "type" => "ip_address"
      },
      {
        "example" => "NewHost.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeHostOfCNAMERecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "alias.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewHost.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeHostOfPTRRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "1.1.1.1.in-addr.arpa.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewHost.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeHostOfTXTRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "Content",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "NewHostname.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeIPOfAAAARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "IPAddress",
        "sigil" => "\$",
        "type" => "ipv6_address"
      },
      {
        "example" => "New IP",
        "sigil" => "\$",
        "type" => "ipv6_address"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeIPOfARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "1.1.1.1",
        "sigil" => "\$",
        "type" => "ip_address"
      },
      {
        "example" => "1.1.2.2",
        "sigil" => "\$",
        "type" => "ip_address"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeIPOfPTRRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "1.1.1.1.in-addr.arpa.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "1.1.2.2.in-addr.arpa.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeMailServerOfMXRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "ServedZone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "MailServer.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewServer.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeMinimumCacheOfSOARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => 86400,
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeNameServerOfNSRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "ServedDomain.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "NameServer.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewNameServer.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeNameServerOfSOARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "NewNameServer.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangePriorityOfMXRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "ServedZone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "MailServer.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => 10,
        "sigil" => "\$",
        "type" => "unsigned_short"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeRefreshIntervalOfSOARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => 86400,
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeRetryIntervalOfSOARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => 86400,
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeSerialNumberOfSOARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Serial Number",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeServedDomainOfNSRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "ServedDomain.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "NameServer.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewDomain.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeServedZoneOfMXRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "ServedZone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "MailServer.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewZone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeTTLOfAAAARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "IPAddress",
        "sigil" => "\$",
        "type" => "ipv6_address"
      },
      {
        "example" => "NewTTL",
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeTTLOfARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "1.1.1.1",
        "sigil" => "\$",
        "type" => "ip_address"
      },
      {
        "example" => "NewTTL",
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeTTLOfCNAMERecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "alias.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewTTL",
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeTTLOfMXRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "ServedZone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "MailServer.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewTTL",
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeTTLOfNSRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "ServedDomain.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "NameServer.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewTTL",
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeTTLOfPTRRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "1.1.1.1.in-addr.arpa.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "NewTTL",
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeTTLOfSOARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "NewTTL",
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeTTLOfTXTRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "Content",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "NewTTL",
        "sigil" => "\$",
        "type" => "unsigned"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeUserEmail" => {
    "arg_info" => [
      {
        "example" => "UserName",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "NewEmail",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_ChangeUserPassword" => {
    "arg_info" => [
      {
        "example" => "UserName",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "OldPassword",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "NewPassword",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CloseConnection" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateAAAARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "IPAddress",
        "sigil" => "\$",
        "type" => "ipv6_address"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateARecord" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "HostName.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "ipAddr",
        "sigil" => "\$",
        "type" => "ip_address"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateCNAMERecord" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Alias.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "HostName.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateMXRecord" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "ServedZone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "MailServer.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "priority",
        "sigil" => "\$",
        "type" => "unsigned_short"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateNSRecord" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "SubDomain.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "NameServer.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreatePTRRecord" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "4.3.2.1.in-addr.arpa.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "HostName.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreatePrimaryZone" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateRPRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "user\@domain.com",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "data.",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateResourceRecord" => {
    "arg_info" => [
      {
        "example" => "0303372E01CBF764",
        "sigil" => "\$",
        "type" => "id"
      },
      {
        "example" => "www.example.biz.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => 1,
        "sigil" => "\$",
        "type" => "unsigned_short"
      },
      {
        "example" => 1025,
        "sigil" => "\$",
        "type" => "unsigned_short"
      },
      {
        "example" => 300,
        "sigil" => "\$",
        "type" => "unsigned_short"
      },
      {
        "example" => "982a1479b1273891273c81279831d",
        "sigil" => "\$",
        "type" => "hexint"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateSSHFPRecord" => {
    "arg_info" => [
      {
        "example" => "test.zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "sshfp2.test.zonel.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => 0,
        "sigil" => "\$",
        "type" => "unsigned_short"
      },
      {
        "example" => 1,
        "sigil" => "\$",
        "type" => "unsigned_short"
      },
      {
        "example" => "0123456789abcdef",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateSecondaryZone" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "PrimaryNameServer",
        "sigil" => "\$",
        "type" => "ip_address"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateTXTRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "Content",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_CreateUser" => {
    "arg_info" => [
      {
        "example" => "NewUserName",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "Password",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "Email",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "FirstInitial",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "LastInitial",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "ServicePkg",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "PricingPkg",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteAAAARecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "IPAddress",
        "sigil" => "\$",
        "type" => "ipv6_address"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteARecord" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "HostName.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "ipAddr",
        "sigil" => "\$",
        "type" => "ip_address"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteAllRecordsOfUser" => {
    "arg_info" => [
      {
        "example" => "UserName",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteCNAMERecord" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Alias.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteMXRecord" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "ServedZone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "MailServer.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteMailForward" => {
    "arg_info" => [
      {
        "example" => "guid",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "domain.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteNSRecord" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "SubDomain.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "NameServer.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeletePTRRecord" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "4.3.2.1.in-addr.arpa.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "HostName.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteRPRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Host.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "email",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteResourceRecord" => {
    "arg_info" => [
      {
        "example" => "0303372E01CBF764",
        "sigil" => "\$",
        "type" => "id"
      },
      {
        "example" => "0403372E01CBF99F",
        "sigil" => "\$",
        "type" => "id"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteSSHFPRecord" => {
    "arg_info" => [
      {
        "example" => "test.zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "sshfp.test.zone.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteTXTRecord" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteUser" => {
    "arg_info" => [
      {
        "example" => "UserName",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteUserXInfo" => {
    "arg_info" => [
      {
        "example" => "Username",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "FieldName",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteWebForward" => {
    "arg_info" => [
      {
        "example" => "guid",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "domain.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DeleteZone" => {
    "arg_info" => [
      {
        "example" => "ZoneName.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_DisableAutoSerialUpdate" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_Disconnect" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_EnableAutoSerialUpdate" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_FindResourceRecords" => {
    "arg_info" => [
      {
        "example" => "0123456789ABCDEF",
        "sigil" => "\$",
        "type" => "id"
      },
      {
        "example" => "hostname.myzone.com.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => 1,
        "sigil" => "\$",
        "type" => "unsigned_short"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetAAAARecordsOfZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetARecordsOfZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetASNForRecord" => {
    "arg_info" => [
      {
        "example" => "0123456789ABCDEF",
        "sigil" => "\$",
        "type" => "id"
      },
      {
        "example" => "123456789ABCDEF0",
        "sigil" => "\$",
        "type" => "id"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetASNList" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_GetAllRRsOfZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetAllZonesOfUser" => {
    "arg_info" => [
      {
        "example" => "UserName",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetAutoSerialUpdateState" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_GetCNAMERecordsOfZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetDirectionalMaskForRecord" => {
    "arg_info" => [
      {
        "example" => "0123456789ABCDEF",
        "sigil" => "\$",
        "type" => "id"
      },
      {
        "example" => "123456789ABCDEF0",
        "sigil" => "\$",
        "type" => "id"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetDirectionalServerList" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_GetMXRecordsOfZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetNSRecordsOfZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetPTRRecordsOfZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetPrimaryZonesOfUser" => {
    "arg_info" => [
      {
        "example" => "UserName",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetRPRecordsOfZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetRecordsOfDnameByType" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "Type",
        "sigil" => "\$",
        "type" => "int"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetSOARecordOfZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetSSHFPRecordsOfZone" => {
    "arg_info" => [
      {
        "example" => "test.zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetSecondaryZonesOfUser" => {
    "arg_info" => [
      {
        "example" => "UserName",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetServerStatus" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_GetTXTRecordsOfZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetUserXInfo" => {
    "arg_info" => [
      {
        "example" => "Username",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "FieldName",
        "sigil" => "\$",
        "type" => "string"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GetUsers" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_GetZoneInfo" => {
    "arg_info" => [
      {
        "example" => "test.zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GrantPermissionsToAccountZonesForUser" => {
    "arg_info" => [
      {
        "example" => "account",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "user",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "allowCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowDelete",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyDelete",
        "sigil" => "\$",
        "type" => "boolean"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GrantPermissionsToMailForwardForUser" => {
    "arg_info" => [
      {
        "example" => "user",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "mailforward",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "allowCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowDelete",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyDelete",
        "sigil" => "\$",
        "type" => "boolean"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GrantPermissionsToWebForwardForUser" => {
    "arg_info" => [
      {
        "example" => "user",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "webforward",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "allowCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowDelete",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyDelete",
        "sigil" => "\$",
        "type" => "boolean"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GrantPermissionsToZoneForUser" => {
    "arg_info" => [
      {
        "example" => "user",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "allowCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowDelete",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyDelete",
        "sigil" => "\$",
        "type" => "boolean"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GrantPermissionsToZoneMailForwardsForUser" => {
    "arg_info" => [
      {
        "example" => "user",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "allowCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowDelete",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyDelete",
        "sigil" => "\$",
        "type" => "boolean"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_GrantPermissionsToZoneWebForwardsForUser" => {
    "arg_info" => [
      {
        "example" => "user",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "allowCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "allowDelete",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyCreate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyRead",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyUpdate",
        "sigil" => "\$",
        "type" => "boolean"
      },
      {
        "example" => "denyDelete",
        "sigil" => "\$",
        "type" => "boolean"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_NoAutoCommit" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_OpenConnection" => {
    "arg_info" => [
      {
        "example" => "SponsorID",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "UserName",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "Password",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "3.0",
        "sigil" => "\$",
        "type" => "float"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_QueryMailForwards" => {
    "arg_info" => [
      {
        "example" => "domain.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_QueryWebForwards" => {
    "arg_info" => [
      {
        "example" => "domain.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_RemoveRestrictIPForAllZones" => {
    "arg_info" => [],
    "last_arg_repeats" => 0
  },
  "UDNS_RemoveRestrictIPForZone" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "start_ip",
        "sigil" => "\$",
        "type" => "ip_address"
      },
      {
        "example" => "end_ip",
        "sigil" => "\$",
        "type" => "ip_address"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_RequestZoneTransfer" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_SetASNForRecord" => {
    "arg_info" => [
      {
        "example" => "0123456789ABCDEF",
        "sigil" => "\$",
        "type" => "id"
      },
      {
        "example" => "123456789ABCDEF0",
        "sigil" => "\$",
        "type" => "id"
      },
      {
        "example" => 1,
        "sigil" => "\$",
        "type" => "integer"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_SetDirectionalMaskForRecord" => {
    "arg_info" => [
      {
        "example" => "0123456789ABCDEF",
        "sigil" => "\$",
        "type" => "id"
      },
      {
        "example" => "123456789ABCDEF0",
        "sigil" => "\$",
        "type" => "id"
      },
      {
        "elem_type" => "unsigned_int",
        "sigil" => "\\\@",
        "type" => "array"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_UpdateAAAARecords" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "IPAddress",
        "sigil" => "\@",
        "type" => "ipv6_address"
      }
    ],
    "last_arg_repeats" => 1
  },
  "UDNS_UpdateARecords" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "IP address",
        "sigil" => "\@",
        "type" => "ip_address"
      }
    ],
    "last_arg_repeats" => 1
  },
  "UDNS_UpdateCNAMERecords" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "CNAME.",
        "sigil" => "\$",
        "type" => "hostname"
      },
      {
        "example" => "Hostname.",
        "sigil" => "\@",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 1
  },
  "UDNS_UpdateMailForward" => {
    "arg_info" => [
      {
        "example" => "guid",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "forwardTo",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "domain.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  },
  "UDNS_UpdateNSRecords" => {
    "arg_info" => [
      {
        "example" => "Zone.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "Zone for NS.",
        "sigil" => "\$",
        "type" => "zonename"
      },
      {
        "example" => "NS hostname.",
        "sigil" => "\@",
        "type" => "hostname"
      }
    ],
    "last_arg_repeats" => 1
  },
  "UDNS_UpdateWebForward" => {
    "arg_info" => [
      {
        "example" => "guid",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "requestTo",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "redirectTo",
        "sigil" => "\$",
        "type" => "string"
      },
      {
        "example" => "forwardType",
        "sigil" => "\$",
        "type" => "unsigned"
      },
      {
        "example" => "domain.",
        "sigil" => "\$",
        "type" => "zonename"
      }
    ],
    "last_arg_repeats" => 0
  }
};


1;
=head2 UDNS_AddMailForward

  $udns->UDNS_AddMailForward($string, $string, $zonename);

  $string = emailTo
  $string = forwardTo
  $zonename = domain.

=head2 UDNS_AddRestrictIPForAllZones

  $udns->UDNS_AddRestrictIPForAllZones($ip_address, $ip_address);

  $ip_address = start_ip
  $ip_address = end_ip

=head2 UDNS_AddRestrictIPForZone

  $udns->UDNS_AddRestrictIPForZone($zonename, $ip_address, $ip_address);

  $zonename = Zone.
  $ip_address = start_ip
  $ip_address = end_ip

=head2 UDNS_AddUserXInfo

  $udns->UDNS_AddUserXInfo($string, $string, $string);

  $string = Username
  $string = FieldName
  $string = Value

=head2 UDNS_AddWebForward

  $udns->UDNS_AddWebForward($string, $string, $unsigned, $zonename);

  $string = requestTo
  $string = redirectTo
  $unsigned = forwardType
  $zonename = domain.

=head2 UDNS_ChangeAliasOfCNAMERecord

  $udns->UDNS_ChangeAliasOfCNAMERecord($zonename, $hostname, $hostname, $hostname);

  $zonename = Zone.
  $hostname = alias.
  $hostname = host.
  $hostname = NewAlias.

=head2 UDNS_ChangeContentOfTXTRecord 

  $udns->UDNS_ChangeContentOfTXTRecord ($zonename, $hostname, $string, $string);

  $zonename = Zone.
  $hostname = Hostname.
  $string = OldContent
  $string = NewContent

=head2 UDNS_ChangeEmailOfSOARecord

  $udns->UDNS_ChangeEmailOfSOARecord($zonename, $string);

  $zonename = Zone.
  $string = user@domain.com

=head2 UDNS_ChangeExpireLimitOfSOARecord

  $udns->UDNS_ChangeExpireLimitOfSOARecord($zonename, $unsigned);

  $zonename = Zone.
  $unsigned = 86400

=head2 UDNS_ChangeHostOfAAAARecord

  $udns->UDNS_ChangeHostOfAAAARecord($zonename, $hostname, $ipv6_address, $hostname);

  $zonename = Zone.
  $hostname = Hostname.
  $ipv6_address = IPAddress
  $hostname = NewHostname.

=head2 UDNS_ChangeHostOfARecord

  $udns->UDNS_ChangeHostOfARecord($zonename, $hostname, $ip_address, $hostname);

  $zonename = Zone.
  $hostname = host.
  $ip_address = 1.1.1.1
  $hostname = NewHost.

=head2 UDNS_ChangeHostOfCNAMERecord

  $udns->UDNS_ChangeHostOfCNAMERecord($zonename, $hostname, $hostname, $hostname);

  $zonename = Zone.
  $hostname = alias.
  $hostname = host.
  $hostname = NewHost.

=head2 UDNS_ChangeHostOfPTRRecord

  $udns->UDNS_ChangeHostOfPTRRecord($zonename, $hostname, $hostname, $hostname);

  $zonename = Zone.
  $hostname = 1.1.1.1.in-addr.arpa.
  $hostname = host.
  $hostname = NewHost.

=head2 UDNS_ChangeHostOfTXTRecord

  $udns->UDNS_ChangeHostOfTXTRecord($zonename, $hostname, $string, $hostname);

  $zonename = Zone.
  $hostname = Hostname.
  $string = Content
  $hostname = NewHostname.

=head2 UDNS_ChangeIPOfAAAARecord

  $udns->UDNS_ChangeIPOfAAAARecord($zonename, $hostname, $ipv6_address, $ipv6_address);

  $zonename = Zone.
  $hostname = Hostname.
  $ipv6_address = IPAddress
  $ipv6_address = New IP

=head2 UDNS_ChangeIPOfARecord

  $udns->UDNS_ChangeIPOfARecord($zonename, $hostname, $ip_address, $ip_address);

  $zonename = Zone.
  $hostname = host.
  $ip_address = 1.1.1.1
  $ip_address = 1.1.2.2

=head2 UDNS_ChangeIPOfPTRRecord

  $udns->UDNS_ChangeIPOfPTRRecord($zonename, $hostname, $hostname, $hostname);

  $zonename = Zone.
  $hostname = 1.1.1.1.in-addr.arpa.
  $hostname = host.
  $hostname = 1.1.2.2.in-addr.arpa.

=head2 UDNS_ChangeMailServerOfMXRecord

  $udns->UDNS_ChangeMailServerOfMXRecord($zonename, $zonename, $hostname, $hostname);

  $zonename = Zone.
  $zonename = ServedZone.
  $hostname = MailServer.
  $hostname = NewServer.

=head2 UDNS_ChangeMinimumCacheOfSOARecord

  $udns->UDNS_ChangeMinimumCacheOfSOARecord($zonename, $unsigned);

  $zonename = Zone.
  $unsigned = 86400

=head2 UDNS_ChangeNameServerOfNSRecord

  $udns->UDNS_ChangeNameServerOfNSRecord($zonename, $zonename, $hostname, $hostname);

  $zonename = Zone.
  $zonename = ServedDomain.
  $hostname = NameServer.
  $hostname = NewNameServer.

=head2 UDNS_ChangeNameServerOfSOARecord

  $udns->UDNS_ChangeNameServerOfSOARecord($zonename, $hostname);

  $zonename = Zone.
  $hostname = NewNameServer.

=head2 UDNS_ChangePriorityOfMXRecord

  $udns->UDNS_ChangePriorityOfMXRecord($zonename, $zonename, $hostname, $unsigned_short);

  $zonename = Zone.
  $zonename = ServedZone.
  $hostname = MailServer.
  $unsigned_short = 10

=head2 UDNS_ChangeRefreshIntervalOfSOARecord

  $udns->UDNS_ChangeRefreshIntervalOfSOARecord($zonename, $unsigned);

  $zonename = Zone.
  $unsigned = 86400

=head2 UDNS_ChangeRetryIntervalOfSOARecord

  $udns->UDNS_ChangeRetryIntervalOfSOARecord($zonename, $unsigned);

  $zonename = Zone.
  $unsigned = 86400

=head2 UDNS_ChangeSerialNumberOfSOARecord

  $udns->UDNS_ChangeSerialNumberOfSOARecord($zonename, $string);

  $zonename = Zone.
  $string = Serial Number

=head2 UDNS_ChangeServedDomainOfNSRecord

  $udns->UDNS_ChangeServedDomainOfNSRecord($zonename, $zonename, $hostname, $zonename);

  $zonename = Zone.
  $zonename = ServedDomain.
  $hostname = NameServer.
  $zonename = NewDomain.

=head2 UDNS_ChangeServedZoneOfMXRecord

  $udns->UDNS_ChangeServedZoneOfMXRecord($zonename, $zonename, $hostname, $zonename);

  $zonename = Zone.
  $zonename = ServedZone.
  $hostname = MailServer.
  $zonename = NewZone.

=head2 UDNS_ChangeTTLOfAAAARecord

  $udns->UDNS_ChangeTTLOfAAAARecord($zonename, $hostname, $ipv6_address, $unsigned);

  $zonename = Zone.
  $hostname = Hostname.
  $ipv6_address = IPAddress
  $unsigned = NewTTL

=head2 UDNS_ChangeTTLOfARecord

  $udns->UDNS_ChangeTTLOfARecord($zonename, $hostname, $ip_address, $unsigned);

  $zonename = Zone.
  $hostname = host.
  $ip_address = 1.1.1.1
  $unsigned = NewTTL

=head2 UDNS_ChangeTTLOfCNAMERecord

  $udns->UDNS_ChangeTTLOfCNAMERecord($zonename, $hostname, $hostname, $unsigned);

  $zonename = Zone.
  $hostname = alias.
  $hostname = host.
  $unsigned = NewTTL

=head2 UDNS_ChangeTTLOfMXRecord

  $udns->UDNS_ChangeTTLOfMXRecord($zonename, $zonename, $hostname, $unsigned);

  $zonename = Zone.
  $zonename = ServedZone.
  $hostname = MailServer.
  $unsigned = NewTTL

=head2 UDNS_ChangeTTLOfNSRecord

  $udns->UDNS_ChangeTTLOfNSRecord($zonename, $zonename, $hostname, $unsigned);

  $zonename = Zone.
  $zonename = ServedDomain.
  $hostname = NameServer.
  $unsigned = NewTTL

=head2 UDNS_ChangeTTLOfPTRRecord

  $udns->UDNS_ChangeTTLOfPTRRecord($zonename, $hostname, $hostname, $unsigned);

  $zonename = Zone.
  $hostname = 1.1.1.1.in-addr.arpa.
  $hostname = host.
  $unsigned = NewTTL

=head2 UDNS_ChangeTTLOfSOARecord

  $udns->UDNS_ChangeTTLOfSOARecord($zonename, $unsigned);

  $zonename = Zone.
  $unsigned = NewTTL

=head2 UDNS_ChangeTTLOfTXTRecord

  $udns->UDNS_ChangeTTLOfTXTRecord($zonename, $hostname, $string, $unsigned);

  $zonename = Zone.
  $hostname = Hostname.
  $string = Content
  $unsigned = NewTTL

=head2 UDNS_ChangeUserEmail

  $udns->UDNS_ChangeUserEmail($string, $string);

  $string = UserName
  $string = NewEmail

=head2 UDNS_ChangeUserPassword

  $udns->UDNS_ChangeUserPassword($string, $string, $string);

  $string = UserName
  $string = OldPassword
  $string = NewPassword

=head2 UDNS_CloseConnection

  $udns->UDNS_CloseConnection;

=head2 UDNS_CreateAAAARecord

  $udns->UDNS_CreateAAAARecord($zonename, $hostname, $ipv6_address);

  $zonename = Zone.
  $hostname = Hostname.
  $ipv6_address = IPAddress

=head2 UDNS_CreateARecord

  $udns->UDNS_CreateARecord($zonename, $hostname, $ip_address);

  $zonename = ZoneName.
  $hostname = HostName.
  $ip_address = ipAddr

=head2 UDNS_CreateCNAMERecord

  $udns->UDNS_CreateCNAMERecord($zonename, $hostname, $hostname);

  $zonename = ZoneName.
  $hostname = Alias.
  $hostname = HostName.

=head2 UDNS_CreateMXRecord

  $udns->UDNS_CreateMXRecord($zonename, $zonename, $hostname, $unsigned_short);

  $zonename = ZoneName.
  $zonename = ServedZone.
  $hostname = MailServer.
  $unsigned_short = priority

=head2 UDNS_CreateNSRecord

  $udns->UDNS_CreateNSRecord($zonename, $zonename, $hostname);

  $zonename = ZoneName.
  $zonename = SubDomain.
  $hostname = NameServer.

=head2 UDNS_CreatePTRRecord

  $udns->UDNS_CreatePTRRecord($zonename, $hostname, $hostname);

  $zonename = ZoneName.
  $hostname = 4.3.2.1.in-addr.arpa.
  $hostname = HostName.

=head2 UDNS_CreatePrimaryZone

  $udns->UDNS_CreatePrimaryZone($zonename);

  $zonename = ZoneName.

=head2 UDNS_CreateRPRecord

  $udns->UDNS_CreateRPRecord($zonename, $hostname, $string, $string);

  $zonename = Zone.
  $hostname = Host.
  $string = user@domain.com
  $string = data.

=head2 UDNS_CreateResourceRecord

  $udns->UDNS_CreateResourceRecord($id, $hostname, $unsigned_short, $unsigned_short, $unsigned_short, $hexint);

  $id = 0303372E01CBF764
  $hostname = www.example.biz.
  $unsigned_short = 1
  $unsigned_short = 1025
  $unsigned_short = 300
  $hexint = 982a1479b1273891273c81279831d

=head2 UDNS_CreateSSHFPRecord

  $udns->UDNS_CreateSSHFPRecord($zonename, $hostname, $unsigned_short, $unsigned_short, $string);

  $zonename = test.zone.
  $hostname = sshfp2.test.zonel.
  $unsigned_short = 0
  $unsigned_short = 1
  $string = 0123456789abcdef

=head2 UDNS_CreateSecondaryZone

  $udns->UDNS_CreateSecondaryZone($zonename, $ip_address);

  $zonename = ZoneName.
  $ip_address = PrimaryNameServer

=head2 UDNS_CreateTXTRecord

  $udns->UDNS_CreateTXTRecord($zonename, $hostname, $string);

  $zonename = Zone.
  $hostname = Hostname.
  $string = Content

=head2 UDNS_CreateUser

  $udns->UDNS_CreateUser($string, $string, $string, $string, $string, $string, $string);

  $string = NewUserName
  $string = Password
  $string = Email
  $string = FirstInitial
  $string = LastInitial
  $string = ServicePkg
  $string = PricingPkg

=head2 UDNS_DeleteAAAARecord

  $udns->UDNS_DeleteAAAARecord($zonename, $hostname, $ipv6_address);

  $zonename = Zone.
  $hostname = Hostname.
  $ipv6_address = IPAddress

=head2 UDNS_DeleteARecord

  $udns->UDNS_DeleteARecord($zonename, $hostname, $ip_address);

  $zonename = ZoneName.
  $hostname = HostName.
  $ip_address = ipAddr

=head2 UDNS_DeleteAllRecordsOfUser

  $udns->UDNS_DeleteAllRecordsOfUser($string);

  $string = UserName

=head2 UDNS_DeleteCNAMERecord

  $udns->UDNS_DeleteCNAMERecord($zonename, $hostname);

  $zonename = ZoneName.
  $hostname = Alias.

=head2 UDNS_DeleteMXRecord

  $udns->UDNS_DeleteMXRecord($zonename, $zonename, $hostname);

  $zonename = ZoneName.
  $zonename = ServedZone.
  $hostname = MailServer.

=head2 UDNS_DeleteMailForward

  $udns->UDNS_DeleteMailForward($string, $zonename);

  $string = guid
  $zonename = domain.

=head2 UDNS_DeleteNSRecord

  $udns->UDNS_DeleteNSRecord($zonename, $zonename, $hostname);

  $zonename = ZoneName.
  $zonename = SubDomain.
  $hostname = NameServer.

=head2 UDNS_DeletePTRRecord

  $udns->UDNS_DeletePTRRecord($zonename, $hostname, $hostname);

  $zonename = ZoneName.
  $hostname = 4.3.2.1.in-addr.arpa.
  $hostname = HostName.

=head2 UDNS_DeleteRPRecord

  $udns->UDNS_DeleteRPRecord($zonename, $hostname, $string);

  $zonename = Zone.
  $hostname = Host.
  $string = email

=head2 UDNS_DeleteResourceRecord

  $udns->UDNS_DeleteResourceRecord($id, $id);

  $id = 0303372E01CBF764
  $id = 0403372E01CBF99F

=head2 UDNS_DeleteSSHFPRecord

  $udns->UDNS_DeleteSSHFPRecord($zonename, $hostname);

  $zonename = test.zone.
  $hostname = sshfp.test.zone.

=head2 UDNS_DeleteTXTRecord

  $udns->UDNS_DeleteTXTRecord($zonename, $hostname);

  $zonename = Zone.
  $hostname = Hostname.

=head2 UDNS_DeleteUser

  $udns->UDNS_DeleteUser($string);

  $string = UserName

=head2 UDNS_DeleteUserXInfo

  $udns->UDNS_DeleteUserXInfo($string, $string);

  $string = Username
  $string = FieldName

=head2 UDNS_DeleteWebForward

  $udns->UDNS_DeleteWebForward($string, $zonename);

  $string = guid
  $zonename = domain.

=head2 UDNS_DeleteZone

  $udns->UDNS_DeleteZone($zonename);

  $zonename = ZoneName.

=head2 UDNS_DisableAutoSerialUpdate

  $udns->UDNS_DisableAutoSerialUpdate;

=head2 UDNS_Disconnect

  $udns->UDNS_Disconnect;

=head2 UDNS_EnableAutoSerialUpdate

  $udns->UDNS_EnableAutoSerialUpdate;

=head2 UDNS_FindResourceRecords

  $udns->UDNS_FindResourceRecords($id, $hostname, $unsigned_short);

  $id = 0123456789ABCDEF
  $hostname = hostname.myzone.com.
  $unsigned_short = 1

=head2 UDNS_GetAAAARecordsOfZone

  $udns->UDNS_GetAAAARecordsOfZone($zonename);

  $zonename = Zone.

=head2 UDNS_GetARecordsOfZone

  $udns->UDNS_GetARecordsOfZone($zonename);

  $zonename = Zone.

=head2 UDNS_GetASNForRecord

  $udns->UDNS_GetASNForRecord($id, $id);

  $id = 0123456789ABCDEF
  $id = 123456789ABCDEF0

=head2 UDNS_GetASNList

  $udns->UDNS_GetASNList;

=head2 UDNS_GetAllRRsOfZone

  $udns->UDNS_GetAllRRsOfZone($zonename);

  $zonename = Zone.

=head2 UDNS_GetAllZonesOfUser

  $udns->UDNS_GetAllZonesOfUser($string);

  $string = UserName

=head2 UDNS_GetAutoSerialUpdateState

  $udns->UDNS_GetAutoSerialUpdateState;

=head2 UDNS_GetCNAMERecordsOfZone

  $udns->UDNS_GetCNAMERecordsOfZone($zonename);

  $zonename = Zone.

=head2 UDNS_GetDirectionalMaskForRecord

  $udns->UDNS_GetDirectionalMaskForRecord($id, $id);

  $id = 0123456789ABCDEF
  $id = 123456789ABCDEF0

=head2 UDNS_GetDirectionalServerList

  $udns->UDNS_GetDirectionalServerList;

=head2 UDNS_GetMXRecordsOfZone

  $udns->UDNS_GetMXRecordsOfZone($zonename);

  $zonename = Zone.

=head2 UDNS_GetNSRecordsOfZone

  $udns->UDNS_GetNSRecordsOfZone($zonename);

  $zonename = Zone.

=head2 UDNS_GetPTRRecordsOfZone

  $udns->UDNS_GetPTRRecordsOfZone($zonename);

  $zonename = Zone.

=head2 UDNS_GetPrimaryZonesOfUser

  $udns->UDNS_GetPrimaryZonesOfUser($string);

  $string = UserName

=head2 UDNS_GetRPRecordsOfZone

  $udns->UDNS_GetRPRecordsOfZone($zonename);

  $zonename = Zone.

=head2 UDNS_GetRecordsOfDnameByType

  $udns->UDNS_GetRecordsOfDnameByType($zonename, $hostname, $int);

  $zonename = Zone.
  $hostname = Hostname.
  $int = Type

=head2 UDNS_GetSOARecordOfZone

  $udns->UDNS_GetSOARecordOfZone($zonename);

  $zonename = Zone.

=head2 UDNS_GetSSHFPRecordsOfZone

  $udns->UDNS_GetSSHFPRecordsOfZone($zonename);

  $zonename = test.zone.

=head2 UDNS_GetSecondaryZonesOfUser

  $udns->UDNS_GetSecondaryZonesOfUser($string);

  $string = UserName

=head2 UDNS_GetServerStatus

  $udns->UDNS_GetServerStatus;

=head2 UDNS_GetTXTRecordsOfZone

  $udns->UDNS_GetTXTRecordsOfZone($zonename);

  $zonename = Zone.

=head2 UDNS_GetUserXInfo

  $udns->UDNS_GetUserXInfo($string, $string);

  $string = Username
  $string = FieldName

=head2 UDNS_GetUsers

  $udns->UDNS_GetUsers;

=head2 UDNS_GetZoneInfo

  $udns->UDNS_GetZoneInfo($zonename);

  $zonename = test.zone.

=head2 UDNS_GrantPermissionsToAccountZonesForUser

  $udns->UDNS_GrantPermissionsToAccountZonesForUser($string, $string, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean);

  $string = account
  $string = user
  $boolean = allowCreate
  $boolean = allowRead
  $boolean = allowUpdate
  $boolean = allowDelete
  $boolean = denyCreate
  $boolean = denyRead
  $boolean = denyUpdate
  $boolean = denyDelete

=head2 UDNS_GrantPermissionsToMailForwardForUser

  $udns->UDNS_GrantPermissionsToMailForwardForUser($string, $string, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean);

  $string = user
  $string = mailforward
  $boolean = allowCreate
  $boolean = allowRead
  $boolean = allowUpdate
  $boolean = allowDelete
  $boolean = denyCreate
  $boolean = denyRead
  $boolean = denyUpdate
  $boolean = denyDelete

=head2 UDNS_GrantPermissionsToWebForwardForUser

  $udns->UDNS_GrantPermissionsToWebForwardForUser($string, $string, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean);

  $string = user
  $string = webforward
  $boolean = allowCreate
  $boolean = allowRead
  $boolean = allowUpdate
  $boolean = allowDelete
  $boolean = denyCreate
  $boolean = denyRead
  $boolean = denyUpdate
  $boolean = denyDelete

=head2 UDNS_GrantPermissionsToZoneForUser

  $udns->UDNS_GrantPermissionsToZoneForUser($string, $zonename, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean);

  $string = user
  $zonename = Zone.
  $boolean = allowCreate
  $boolean = allowRead
  $boolean = allowUpdate
  $boolean = allowDelete
  $boolean = denyCreate
  $boolean = denyRead
  $boolean = denyUpdate
  $boolean = denyDelete

=head2 UDNS_GrantPermissionsToZoneMailForwardsForUser

  $udns->UDNS_GrantPermissionsToZoneMailForwardsForUser($string, $zonename, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean);

  $string = user
  $zonename = Zone.
  $boolean = allowCreate
  $boolean = allowRead
  $boolean = allowUpdate
  $boolean = allowDelete
  $boolean = denyCreate
  $boolean = denyRead
  $boolean = denyUpdate
  $boolean = denyDelete

=head2 UDNS_GrantPermissionsToZoneWebForwardsForUser

  $udns->UDNS_GrantPermissionsToZoneWebForwardsForUser($string, $zonename, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean, $boolean);

  $string = user
  $zonename = Zone.
  $boolean = allowCreate
  $boolean = allowRead
  $boolean = allowUpdate
  $boolean = allowDelete
  $boolean = denyCreate
  $boolean = denyRead
  $boolean = denyUpdate
  $boolean = denyDelete

=head2 UDNS_QueryMailForwards

  $udns->UDNS_QueryMailForwards($zonename);

  $zonename = domain.

=head2 UDNS_QueryWebForwards

  $udns->UDNS_QueryWebForwards($zonename);

  $zonename = domain.

=head2 UDNS_RemoveRestrictIPForAllZones

  $udns->UDNS_RemoveRestrictIPForAllZones;

=head2 UDNS_RemoveRestrictIPForZone

  $udns->UDNS_RemoveRestrictIPForZone($zonename, $ip_address, $ip_address);

  $zonename = Zone.
  $ip_address = start_ip
  $ip_address = end_ip

=head2 UDNS_RequestZoneTransfer

  $udns->UDNS_RequestZoneTransfer($zonename);

  $zonename = Zone.

=head2 UDNS_SetASNForRecord

  $udns->UDNS_SetASNForRecord($id, $id, $integer);

  $id = 0123456789ABCDEF
  $id = 123456789ABCDEF0
  $integer = 1

=head2 UDNS_SetDirectionalMaskForRecord

  $udns->UDNS_SetDirectionalMaskForRecord($id, $id, \@array);

  $id = 0123456789ABCDEF
  $id = 123456789ABCDEF0
  \@array = [ $unsigned_int, ... ]

=head2 UDNS_UpdateAAAARecords

  $udns->UDNS_UpdateAAAARecords($zonename, $hostname, @ipv6_address);

  $zonename = Zone.
  $hostname = Hostname.
  @ipv6_address = (IPAddress, ...)

=head2 UDNS_UpdateARecords

  $udns->UDNS_UpdateARecords($zonename, $hostname, @ip_address);

  $zonename = Zone.
  $hostname = Hostname.
  @ip_address = (IP address, ...)

=head2 UDNS_UpdateCNAMERecords

  $udns->UDNS_UpdateCNAMERecords($zonename, $hostname, @hostname);

  $zonename = Zone.
  $hostname = CNAME.
  @hostname = (Hostname., ...)

=head2 UDNS_UpdateMailForward

  $udns->UDNS_UpdateMailForward($string, $string, $zonename);

  $string = guid
  $string = forwardTo
  $zonename = domain.

=head2 UDNS_UpdateNSRecords

  $udns->UDNS_UpdateNSRecords($zonename, $zonename, @hostname);

  $zonename = Zone.
  $zonename = Zone for NS.
  @hostname = (NS hostname., ...)

=head2 UDNS_UpdateWebForward

  $udns->UDNS_UpdateWebForward($string, $string, $string, $unsigned, $zonename);

  $string = guid
  $string = requestTo
  $string = redirectTo
  $unsigned = forwardType
  $zonename = domain.


=cut
