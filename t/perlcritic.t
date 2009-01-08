#!perl

use Test::More;

if (!eval { require Test::Perl::Critic }) {
    plan( skip_all => "Test::Perl::Critic required for testing PBP compliance");
}

Test::Perl::Critic->import( -severity => 4 );

all_critic_ok();
