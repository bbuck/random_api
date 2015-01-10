# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'random_api/version'

Gem::Specification.new do |spec|
  spec.name          = "random_api"
  spec.version       = RandomApi::VERSION
  spec.authors       = ["Brandon"]
  spec.email         = ["lordizuriel@gmail.com"]
  spec.summary       = "Interface with the Random API https://randomuser.me"
  spec.description   = "Provide a ruby interface for pulling data from the Random API, fetching random user data."
  spec.homepage      = "https://github.com/bbuck/random_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.13.3"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "pry"
end
