# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vindicator/version'

Gem::Specification.new do |gem|
  gem.name          = "vindicator"
  gem.version       = Vindicator::VERSION
  gem.authors       = ["Johnathan Ludwig"]
  gem.email         = ["john@johnathanludwig.com"]
  gem.description   = %q{VINdicator is a small gem that will allow you to verify that a VIN is valid based on its check digit.}
  gem.summary       = %q{VINdicator is a small gem that will allow you to verify that a VIN is valid based on its check digit.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
