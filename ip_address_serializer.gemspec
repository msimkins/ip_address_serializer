# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ip_address_serializer/version'

Gem::Specification.new do |spec|
  spec.name          = "ip_address_serializer"
  spec.version       = IpAddressSerializer::VERSION
  spec.authors       = ["Mike Simkins"]
  spec.email         = ["software@g7obs.com"]
  spec.summary       = %q{Gem to enable serialized storage of an IP Address in a string}
  spec.description   = %q{ActiveRecord Serializer to allow the storage of a CIDR IP Address in a String Field}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "ruby-ip", "~> 0.9"
  spec.add_dependency "activemodel", "~> 4.0"
end
