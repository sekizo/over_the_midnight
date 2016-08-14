# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'over_the_midnight/version'

Gem::Specification.new do |spec|
  spec.name          = "over_the_midnight"
  spec.version       = OverTheMidnight::VERSION
  spec.authors       = ["sekizo"]
  spec.email         = ["sekizoworld@mac.com"]

  spec.summary       = %q{Implements the time expression which strided date.}
  spec.description   = %q{Implements the time expression which strided date.}
  spec.homepage      = "https://github.com/sekizo/over_the_midnight"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
