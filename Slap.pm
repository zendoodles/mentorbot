package Bot::BasicBot::Pluggable::Module::Slap;
$Bot::BasicBot::Pluggable::Module::Slap::VERSION = '0.87';
use base qw(Bot::BasicBot::Pluggable::Module);
use warnings;
use strict;

sub help {
  return "Slaps users?";
}

sub told {
  my ( $self, $mess ) = @_;
  my $body = $mess->{body};

  if ($body =~ /slap (\w+)/) {
    return "Proceeding to slap $1...";
  }
}
