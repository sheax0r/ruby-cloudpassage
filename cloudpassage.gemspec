# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudpassage/version'

Gem::Specification.new do |gem|
  gem.name          = 'cloudpassage'
  gem.version       = Cloudpassage::VERSION
  gem.authors       = %w'mshea'
  gem.email         = %w'mike.shea@gmail.com'
  gem.description   = %q{API client for cloudpassage}
  gem.summary       = %q{Cloudpassage}
  gem.homepage      = 'https://github.com/sheax0r/ruby-cloudpassage'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w'lib'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.add_dependency 'oauth2'
  gem.add_dependency 'rest-client'
  gem.add_dependency 'json'
end
