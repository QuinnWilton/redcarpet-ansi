# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redcarpet-ansi/version'

Gem::Specification.new do |spec|
  spec.name          = 'redcarpet-ansi'
  spec.version       = RedcarpetANSI::VERSION
  spec.authors       = ['Shane Wilton']
  spec.email         = ['shane.wilton@gmail.com']
  spec.summary       = 'An ANSI renderer for Redcarpet'
  spec.description   = 'An ANSI renderer for Redcarpet'
  spec.homepage      = ''
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  
  spec.add_dependency 'redcarpet'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
