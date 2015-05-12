# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$Loading = [:gems,:base]
$Loading_for = :gemspec
require './lib/restman/'
require 'restman/infomation'


Gem::Specification.new do |spec|
  spec.name          = Restman::Info[:name]
  spec.version       = Restman::Info[:version]
  spec.authors       = [Restman::Info[:author]]
  spec.email         = [Restman::Info[:email]]
  spec.summary       = Restman::Info[:summary]
  spec.description   = Restman::Info[:description]
  spec.homepage      = Restman::Info[:homepage]
  spec.licenses      = Restman::Info[:license]

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "sinatra", "1.4.6"
  spec.add_runtime_dependency "tilt", "1.3"
  spec.add_runtime_dependency "sinatra-formhelpers-ng", "1.9.0"
  spec.add_runtime_dependency "puma", "2.11.2"
  spec.add_runtime_dependency "sucker_punch", "1.4.0"
  spec.add_runtime_dependency "fist_of_fury", "0.2.7"
  spec.add_runtime_dependency "dm-core", "1.2.0"
  spec.add_runtime_dependency "datamapper", "1.2.0"
  spec.add_runtime_dependency "dm-sqlite-adapter", "1.2.0"
  spec.add_runtime_dependency "json", "1.8.2"
  spec.add_runtime_dependency "curb", "0.8.8"
  spec.add_runtime_dependency "commander", "4.3.4"
  spec.add_runtime_dependency "sinatra-contrib", "1.4.2"

  #testing dependencies
  spec.add_development_dependency "rack-test", "0.6.3"
  spec.add_development_dependency "rspec", "3.1.0"
  spec.add_development_dependency "fuubar", "2.0.0"
end
