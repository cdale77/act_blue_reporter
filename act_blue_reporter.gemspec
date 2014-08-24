# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "act_blue_reporter/version"

Gem::Specification.new do |spec|
  spec.name          = "act_blue_reporter"
  spec.version       = ActBlueReporter::VERSION
  spec.authors       = ["Brad Johnson"]
  spec.email         = ["cdale77@gmail.com"]
  spec.summary       = "A Ruby "
  spec.description   = "A Ruby gem to facilitate gathering contribution \
                        information from multiple ActBlue campaigns. "
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "webmock"

  spec.add_runtime_dependency "httparty"
end
