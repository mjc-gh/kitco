Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY

  s.name = 'kitco'
  s.version = '0.0.1'
  s.date = '2011-08-10'

  s.description = "An API for accessing data from Kitco Charts. Also includes a command line utility"
  s.summary = "#{s.description}!"
  
  s.authors = ["mikeycgto"]
  s.email = "mikeycgto@gmail.com"

  s.files = %w[
    README.md
    lib/kitco.rb
    bin/kitco
  ]
  
  s.add_dependency 'httparty',    '>= 0.7.8'
  s.executables = ['kitco']
  s.has_rdoc = false

  s.homepage = "https://github.com/mikeycgto/kitco"
  s.require_paths = %w[lib]
end