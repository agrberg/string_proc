# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'string_proc'
  s.version     = '1.0.5'
  s.summary     = 'Turn a string into proc of a series of methods to be called on an object.'
  s.description = 'Adds `String#to_proc`.'
  s.authors     = ['Aaron Rosenberg']
  s.email       = 'aarongrosenberg@gmail.com'
  s.files       = ['lib/string_proc.rb']
  s.homepage    = 'https://github.com/agrberg/string_proc'
  s.licenses    = ['MIT']
  s.metadata['rubygems_mfa_required'] = 'true'
  s.metadata['source_code_uri'] = 'https://github.com/agrberg/string_proc'
  s.metadata['bug_tracker_uri'] = 'https://github.com/agrberg/string_proc/issues'
  s.required_ruby_version = '>= 3.3'
end
