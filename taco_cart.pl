#!/opt/local/bin/perl
use strict;
use warnings;

package Bot::BasicBot::Pluggable;
use Bot::BasicBot::Pluggable;

my $bot = Bot::BasicBot::Pluggable->new(
  server => 'irc.freenode.net',
  channels => [ '#drupal-watercooler', '#drupal-speakeasy','#zendoodles', '#midcamp'],
  nick => 'taco_cart',
  username => 'taco_cart',
  altnicks => ["taco__cart", "burrito_cart"],
  name => "Super-awesome pluggable bot for #drupal-watercooler.",
);

$bot->load('Auth');
$bot->load('Loader');
$bot->load('Karma');
$bot->load('Infobot');

$bot->run();

