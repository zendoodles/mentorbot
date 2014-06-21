#!/opt/local/bin/perl
use strict;
use warnings;

package Bot::BasicBot::Pluggable;
use Bot::BasicBot::Pluggable;

my $bot = Bot::BasicBot::Pluggable->new(
  server => 'irc.freenode.net',
  channels => [ '#drupal-mentoring', '#zendoodles'],
  nick => 'mentorbot',
  username => 'mentorbot',
  altnicks => ["mentor_bot", "mentor__bot"],
  name => "Super-awesome pluggable bot for #drupal-mentoring.",
);

$bot->load('Auth');
$bot->load('Loader');
$bot->load('Karma');
$bot->load('Infobot');

$bot->run();

