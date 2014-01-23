# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tcx/version'

Gem::Specification.new do |spec|
  spec.name          = "tcx"
  spec.version       = Tcx::VERSION
  spec.authors       = ["Gareth Townsend"]
  spec.email         = ["gareth.townsend@me.com"]
  spec.description   = %q{A gem for parsing TCX files}
  spec.summary       = %q{A gem for parsing TCX files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ox"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
