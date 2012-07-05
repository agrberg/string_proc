Overview
--------

string_proc adds the to_proc method to the Ruby String class. This turns a string of one or more method names to a proc to be called sequentially on an object.
This is useful for being able to send a sequence of method calls to an object. My primary usage of this is passing a proc string into a map call to quickly see values or results of a sequence of methods on an array of objects via array_of_objects.map(&'method_1.method_2')

Setup & Installation
--------------------

Install with `[sudo] gem install string_proc`

Include it in your project's `Gemfile`:

``` ruby
gem 'string_proc'
```

License
---------

This is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License Version 2 as published by the Free Software Foundation: www.gnu.org/copyleft/gpl.html

This is yet another small gem I'm releasing as I feel other people may like the functionality it provides. I use this method all the time while in irb or the rails console. This is a nice way to avoid having to write this method in every project I use and simply just add a gem.

Please feel free to use it or modify it for whatever you like except in the assistance of robots or chimpanzees taking over the world. Gorillas are much cooler and much less vicious than chimps, let's help them out instead.