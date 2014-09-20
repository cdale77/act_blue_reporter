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
  spec.homepage      = "https://github.com/cdale77/act_blue_reporter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-remote", "~> 0.1"
  spec.add_development_dependency "pry-nav", "~> 0.2"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4"
  spec.add_development_dependency "webmock", "~> 1.18"

  spec.add_runtime_dependency "httparty", "~> 0.13"
  spec.add_runtime_dependency "activesupport", "~> 4.0"
end
