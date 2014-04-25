# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ssredis_orm/version'

Gem::Specification.new do |spec|
  spec.name          = "ssredis_orm"
  spec.version       = SsredisOrm::VERSION
  spec.authors       = ["Andres Pache"]
  spec.email         = ["apache90@gmail.com"]
  spec.description   = "Super simple redis orm for learning purposes."
  spec.summary       = "Super simple redis orm for learning purposes."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "redis", "~> 3.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
