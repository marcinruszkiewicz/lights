# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lights/version'

Gem::Specification.new do |s|
  s.name          = 'lights'
  s.version       = LightsConst::VERSION
  s.authors       = ["Brady Turner"]
  s.email         = 'bradyaturner@gmail.com'
  s.description   = "Client library and CLI for controlling Philips Hue lights."
  s.summary       = "lights"
  s.homepage      = 'http://rubygems.org/gems/lights'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency "simpletable", "~> 0.3.2"

  s.add_development_dependency "aruba"
  s.add_development_dependency "bundler"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
