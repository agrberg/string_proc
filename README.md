`String#to_proc` [![Build Status](https://travis-ci.org/agrberg/string_proc.svg?branch=master)](https://travis-ci.org/agrberg/string_proc)
==============

Overview
--------

`string_proc` adds the `to_proc` method to the Ruby String class. This turns a string of one or more method names into a proc to be called sequentially on an object.

Example usage: Passing a proc string into a `map` call to quickly see values or results of a sequence of methods like

```
my_array_of_objects.map(&'method_1.method_2')
  # => [
         object_1.method_1.method_2,
         object_2.method_1.method_2,
         ...
       ]
```

Setup & Installation
--------------------

Include it in your project's `Gemfile`:

    gem 'string_proc'

License
---------

MIT: http://rem.mit-license.org

Errata
------

This is one of the first small gems I published. I believe it contains useful functionality that I do not want to duplicate project to project.

I use this all the time while in `irb` or the Rails console as a nice way to dig into objects and their associated objects via method calls. Like it's cousin [`array_proc`](https://github.com/agrberg/array_proc) it is not intended for production code as it's non-idiomatic Ruby.
