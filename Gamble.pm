package Bot::BasicBot::Pluggable::Module::Gamble;
$Bot::BasicBot::Pluggable::Module::Mantis::VERSION = '0.87';
use base qw(Bot::BasicBot::Pluggable::Module);
use warnings;
use strict;

sub help {
  return "Gambles your money away. Try 'bet X on [1-6]', 'gamble', 'money'.";
}

sub told {
  my ( $self, $mess ) = @_;
  my $body = $mess->{body};
  my $who = $mess->{who};

  if ($body =~ /^bet (\d+) on (\d+)/) {
    my $money = $self->get("gambler_$who");
    my $bet = $1;
    my $on = $2;

    if ($bet > $money) {
      return "You don't have that much to bet.";
    }
    if ($on > 6) {
      return "What kind of die are you using?";
    }
    $money -= $bet;

    my $message;
    my $roll = int(rand(5) + 1);
    if ($roll == $on) {
      $message = "Rolled $roll! You won \$" . $bet*25 . '.';
      $money += ($bet*25);
    }
    else {
      $message = "You rolled a $roll."
    }

    $self->set("gambler_$who", $money);
    return $message;
  }

  if ($body =~ /^money/) {
    my $money = $self->get("gambler_$who");
    if ($money > 0) {
      # They have money already.
    }
    else {
      $money = 100;
      $self->set("gambler_$who" => $money);
      return "Welcome to the game. You have \$$money.";
    }
    return 'You have $' . $money . '.';
  }

  if ($body =~ /^gamble/) {
    my $money = $self->get("gambler_$who");
    if ($money == 0) {
      return "You don't have any money. Type 'money' to enter the game.";
    }
    $money -= 1;
    my $won;
    my $out;
    my @slots = qw(BAR CHERRY GRAPE ORANGE JACKPOT);
    my $size = @slots;
    my @result = ();

    my $result_string_display;
    $out .= "Spin spin spin!";
    for (my $j = 1; $j <= 1; $j++) {
      @result = ();
      for (my $i = 1; $i <= 3; $i++) {
        my $random_number = rand(($size-1));
        push(@result, $slots[$random_number]);
      }
      $result_string_display = join(' | ', @result);
      $out .= "\n" . $result_string_display;
    }

    my $result_string = join(' ', @result);

    $won = 0;
    if ($result_string eq "BAR BAR BAR") {
      $won = 50;
    }
    if ($result_string eq "GRAPE GRAPE GRAPE") {
      $won = 25;
    }
    if ($result_string eq "CHERRY CHERRY CHERRY") {
      $won = 10;
    }
    if ($result_string eq "ORANGE ORANGE ORANGE") {
      $won = 5;
    }
    if ($result_string eq "JACKPOT JACKPOT JACKPOT") {
      $won = 100;
    }
    if ($won > 0) {
      $out .= "\nYou won \$$won!";
      $money += $won;
    }
    else {
    }
    $self->set("gambler_$who", $money);
    return $out;
  }
}
