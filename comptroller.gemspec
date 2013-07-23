# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'comptroller/version'

Gem::Specification.new do |spec|
  spec.name          = "comptroller"
  spec.version       = Comptroller::VERSION
  spec.authors       = ["hubert"]
  spec.email         = ["hubert77@gmail.com"]
  spec.description   = %q{Client gem for accessing the duxtape api}
  spec.summary       = %q{Client gem for accessing the duxtape api}
  spec.homepage      = "https://github.com/hubert/comptroller"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '>= 2.0'
  spec.add_development_dependency 'mimic', '>= 0.4.3'
end
