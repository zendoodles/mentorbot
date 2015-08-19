This is the branch for taco_cart which resides in several channels on freenode including #drupal-watercooler. If you're looking to copy or improve taco_cart, you're in the right place.

I am no expert with perl, so I'm not even sure this is a good way to share a
perl project. Do feel free to improve it and send me a pull request.


Install
-------
To install, you'll need to get some perl modules installed locally. IMO this is
easier with cpanm. It should take care of dependencies and whatnot for you too.
Instructions are on cpan.org: http://www.cpan.org/modules/INSTALL.html

Then you need Bot::BasicBot::Pluggable, XKCD (Bot::BasicBot::Pluggable::Module::XKCD), Weather
(Bot::BasicBot::Pluggable::Module::Weather), and associated dependencies. 

Once you have these, you can launch the bot. It should just pick up the .sqlite
store and remember everything. To launch the bot I use

```nohup perl taco_cart.pl &```

You may want to watch the output the first few times with ``cat nohup.out`` as people interact with the bot. Look for missing dependencies and the like.
