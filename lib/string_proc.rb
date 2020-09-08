# frozen_string_literal: true

class String
  @@proc_separator ||= '.'

  def self.proc_separator=(separator_string)
    @@proc_separator = separator_string
  end

  def to_proc
    proc do |object|
      split(@@proc_separator).inject(object) { |obj, method| obj.send(method) }
    end
  end
end
