package Bot::BasicBot::Pluggable::Module::Fortune;
$Bot::BasicBot::Pluggable::Module::Mantis::VERSION = '0.87';
use base qw(Bot::BasicBot::Pluggable::Module);
use warnings;
use strict;

sub help {
  return "Says witty things, and has a magic 8-ball.";
}

sub told {
  my ( $self, $mess ) = @_;
  my $body = $mess->{body};

  if ($body =~ /fortune!/) {
    return `fortune`;
  }

  if ($body =~ /tell (.*) a fortune/) {
    $self->tell($1, `fortune`);
    return "i will!";
  }

  if ($body =~ /8ball.+/) {
    my $choices = "Signs point to yes.|Yes.|Reply hazy, try again.|Without a doubt.|My sources say no.|As I see it, yes.|You may rely on it.|Concentrate and ask again.|Outlook not so good.|It is decidedly so.|Better not tell you now.|Very doubtful.|Yes - definitely.|It is certain.|Cannot predict now.|Most likely.|Ask again later.|My reply is no.|Outlook good.|Don't count on it.";
    my @arr_choices = split(/\|/, $choices);
    my $size = @arr_choices;
    my $random_number = rand(($size-1));

    return $arr_choices[$random_number];
  }
}
