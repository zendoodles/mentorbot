#!/usr/bin/perl
package Bot::BasicBot::Pluggable;
use Bot::BasicBot::Pluggable;

use warnings;
use strict;

my $bot = Bot::BasicBot::Pluggable->new(
  server => 'irc.freenode.net',
  channels => [ '#zendoodles' ],
  nick => 'zendobot',
  store => 'Deep',
);

$bot->load('Auth');
$bot->load('Loader');

$bot->run();
