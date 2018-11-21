$:.push File.expand_path("../lib", __FILE__)
require 'ruby_arachni/version'

Gem::Specification.new do |s|
  s.name = "ruby_arachni"
  s.version = RubyArachni::VERSION
  s.platform = Gem::Platform::RUBY
  s.licenses = ['MIT']
  s.authors = ["Adilson Chacon"]
  s.email = ["adilsonchacon@gmail.com"]
  s.homepage = %q{https://github.com/adilsonchacon/ruby-acunetix}
  s.summary = "Ruby Arachni Scanner XML Parser"
  s.description = "Ruby Arachni Scanner XML Parser"
  s.date = Time.now

  s.files = Dir["{lib}/**/*"]
  s.require_paths = ["lib"]
end