class String
  @@proc_separator ||= '.'

  def self.proc_separator=(string)
    @@proc_separator = string.to_s
  end

  def to_proc
    proc {|object| split(@@proc_separator).inject(object) {|obj, cmd| obj.send(cmd) } }
  end
end