# frozen_string_literal: true

# Adds `String#to_proc` to allow multiple method chain calls on each element of an enumerable using the `&` shorthand
# The default separator is `.` but can be changed with the `String.proc_separator=` setter
class String
  @proc_separator = '.'

  class << self
    attr_accessor :proc_separator
  end

  def to_proc
    proc do |object|
      split(self.class.proc_separator).reduce(object) { |obj, method| obj.public_send(method) }
    end
  end
end
