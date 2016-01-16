# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'locomotive/view_counter/version'

Gem::Specification.new do |gem|
  gem.name          = 'locomotivecms_view_counter'
  gem.version       = Locomotive::ViewCounter::VERSION
  gem.authors       = ['Didier Lafforgue']
  gem.email         = ['did@locomotivecms.com']
  gem.summary       = %q{Increment the number of views of a content entry}
  gem.description   = %q{Increment the number of views every time Steam renders a content type template.}
  gem.homepage      = 'http://locomotive.works'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake', '~> 10.0.4'
  gem.add_development_dependency 'locomotivecms_steam',   '~> 1.0.0'
end
