# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_i2c/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_i2c"
  spec.version       = RubyI2C.version
  spec.authors       = ["Dean Brundage"]
  spec.email         = ["github@deanandadie.net"]

  spec.summary       = %q{YA Ruby i2c library}
  spec.description   = %q{Yet another ruby i2c library}
  spec.homepage      = "https://github.com/brundage/ruby_i2c"

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency 'coveralls'

  spec.files = [
      'LICENSE.md',
      'README.md',
      'lib/ruby_i2c.rb',
      'lib/ruby_i2c/adapter.rb',
      'lib/ruby_i2c/adapter/base.rb',
      'lib/ruby_i2c/adapter/dummy.rb',
      'lib/ruby_i2c/adapter/unix_device.rb',
      'lib/ruby_i2c/device.rb',
      'lib/ruby_i2c/device/base.rb',
      'lib/ruby_i2c/device/si70xx.rb',
      'lib/ruby_i2c/version.rb',
      'ruby_i2c.gemspec'
  ]
end
