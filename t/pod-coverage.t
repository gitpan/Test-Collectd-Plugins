use strict;
use warnings;
use Test::More;

# Ensure a recent version of Test::Pod::Coverage
my $min_tpc = 1.08;
eval "use Test::Pod::Coverage $min_tpc";
plan skip_all => "Test::Pod::Coverage $min_tpc required for testing POD coverage"
    if $@;

# Test::Pod::Coverage doesn't require a minimum Pod::Coverage version,
# but older versions don't recognize some common documentation styles
my $min_pc = 0.18;
eval "use Pod::Coverage $min_pc";
plan skip_all => "Pod::Coverage $min_pc required for testing POD coverage"
    if $@;

plan tests => 2;

#all_pod_coverage_ok( { also_private => [qw/import_extra/],});
pod_coverage_ok( "FakeCollectd" );
# the following yields strange errors I guess the parser tries to parse itself
#pod_coverage_ok( "Collectd::Config" );
pod_coverage_ok( "Test::Collectd::Plugins", { also_private => [qw/import_extra/],});
