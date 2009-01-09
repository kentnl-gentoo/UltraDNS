
use Test::More qw(no_plan);
use Test::Exception;

use UltraDNS;

do 't/util.pl';

my ($hp,$s,$u,$p) = test_connect_args();

# test bad username/password (sponsor doesn't seem to be checked)
dies_ok { UltraDNS->connect($hp, $s, $u.42, $p) };
like $@, qr/OpenConnection failed with error/;

dies_ok { UltraDNS->connect($hp, $s, $u, $p.42) };
like $@, qr/OpenConnection failed with error/;

# proper connection
my $udns = UltraDNS->connect($hp, $s, $u, $p);
isa_ok $udns, 'UltraDNS';

# test separate simple method call
$rr = $udns->EnableAutoSerialUpdate;
ok $rr;
is ref $rr, 'SCALAR';
is $$rr, undef;

$udns->commit;
is $$rr->value, 'Method succeeded';

$rr = $udns->GetAutoSerialUpdateState;
$udns->commit;
is $$rr->value, 1;

$rr = $udns->DisableAutoSerialUpdate;
$udns->commit;

$rr = $udns->GetAutoSerialUpdateState;
$udns->commit;
is $$rr->value, 0;


# test combined transaction
my @rr = (
    $udns->EnableAutoSerialUpdate,      # 0
    $udns->GetAutoSerialUpdateState,    # 1
    $udns->DisableAutoSerialUpdate,     # 2
    $udns->GetAutoSerialUpdateState,    # 3
);
$udns->commit;

is( (${$rr[1]})->value, 1 );
is( (${$rr[3]})->value, 0 );


