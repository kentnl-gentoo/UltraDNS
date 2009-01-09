
use Test::More qw(no_plan);
use Test::Exception;

use UltraDNS;

do 't/util.pl';

my $udns = test_connect();
my $rr;


$rr = $udns->GetZoneInfo("none--such--zone.com.");

dies_ok { $udns->commit };
like $@, qr/GetZoneInfo failed with error 16: Zone not found/;


my $zone = create_test_zone($udns);

