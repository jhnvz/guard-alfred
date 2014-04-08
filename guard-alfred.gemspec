# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/alfred/version'

Gem::Specification.new do |gem|
  gem.name          = "guard-alfred"
  gem.version       = Guard::AlfredVersion::VERSION
  gem.authors       = ["Johan van Zonneveld"]
  gem.email         = ["johan@vzonneveld.nl"]
  gem.summary       = %q{Guard gem for Alfred::Rails}
  gem.description   = %q{Guard::Alfred automatically creates javascript fixtures on file changes'}
  gem.homepage      = "https://github.com/jhnvz/guard-alfred"
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'guard'

  gem.add_development_dependency 'bundler', '~> 1.5'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'rspec', '>= 2.3'
end
