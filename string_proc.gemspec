Gem::Specification.new do |s|
  s.name        = 'string_proc'
  s.version     = '1.0.0'
  s.date        = '2014-02-03'
  s.summary     = 'Turn a string into proc of a series of methods to be called on an object.'
  s.description = 'Adds the to_proc method to the string class.'
  s.authors     = ['Aaron Rosenberg']
  s.email       = 'aarongrosenberg@gmail.com'
  s.files       = ['lib/string_proc.rb']
  s.homepage    = 'https://github.com/LtCmdDudefellah/string_proc'
  s.licenses    = ['MIT']

  s.add_development_dependency 'rspec', '~> 2.0', '>= 2.0.0'
  s.add_development_dependency 'simplecov', '~> 0.8', '>= 0.8.0'
end
