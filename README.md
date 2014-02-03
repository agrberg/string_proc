Overview
--------

**string_proc** adds the `to_proc` method to the Ruby String class. This turns a string of one or more method names to a proc to be called sequentially on an object.

This allows you to send a sequence of method calls to an object. My primary usage of this is passing a proc string into a `map` call to quickly see values or results of a sequence of methods like

    my_array_of_objects.map(&'method_1.method_2')
      # => [object_1.method_1.method_2, object_2.method_1.method_2, ...]

Setup & Installation
--------------------

Install with `[sudo] gem install string_proc`

Include it in your project's `Gemfile`:

    gem 'string_proc', '~> 1.0'

License
---------

MIT: http://rem.mit-license.org

Errata
------

This is yet another small gem I'm releasing as I feel other people may like the functionality it provides. I use this method all the time while in irb or the rails console. This is a nice way to avoid having to write this method in every project I use and simply just add a gem.

Please feel free to use it or modify it for whatever you like except in the assistance of robots or chimpanzees taking over the world. Gorillas are much cooler and much less vicious than chimps, let's help them out instead.
