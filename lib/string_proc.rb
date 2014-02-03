class String
  @@proc_separator ||= '.'

  def self.proc_separator=(separator_string)
    @@proc_separator = separator_string
  end

  def to_proc
    proc {|object| split(@@proc_separator).inject(object) {|obj, cmd| obj.send(cmd) } }
  end
end
