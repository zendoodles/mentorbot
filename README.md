This is the bot used for mentors in #drupal-mentoring on irc. If you are a
mentor or otherwise looking to improve the bot somehow for mentors, you are in
the right place.

I am no expert with perl, so I'm not even sure this is a good way to share a
perl project. Do feel free to improve it and send me a pull request.


Install
-------
To install, you'll need to get some perl modules installed locally. IMO this is
easier with cpanm. It should take care of dependencies and whatnot for you too.
Instructions are on cpan.org: http://www.cpan.org/modules/INSTALL.html

Then you need Bot::BasicBot::Pluggable and associated dependencies. I'm also a
fan of XKCD (Bot::BasicBot::Pluggable::Module::XKCD) and Weather
(Bot::BasicBot::Pluggable::Module::Weather) but these are not currently enabled
for mentorbot.

Once you have these, you can launch the bot. It should just pick up the .sqlite
store and remember everything. Generally I use

```nohup perl testbot.pl &```

You may also want to watch the output the first few times tho. When I was first
experimenting, I would run it in screen without nohup and watch for errors as it
started and I interacted with it. It's probably easier to use nohup and just cat
nohup.out when you want to peek at the output.
