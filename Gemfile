source 'https://rubygems.org'

# Specify your gem's dependencies in wagon.gemspec
gemspec

# Development
# gem 'locomotivecms_steam', github: 'locomotivecms/steam', ref: '940837b', require: false

# Local development
gem 'locomotivecms_steam', path: '/Users/didier/Documents/LocomotiveCMS/gems/steam', require: false

group :development, :test do
  gem 'pry-byebug',         '~> 3.1.0'
end

group :test do
  gem 'rspec',              '~> 3.2.0'
  gem 'rack-test',          '~> 0.6.3'
  gem 'coveralls',          '~> 0.7.11', require: false
end
