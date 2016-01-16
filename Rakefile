#!/usr/bin/env rake
# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

require 'rake'
require 'rspec'
require 'rspec/core/rake_task'
require 'rubygems/package_task'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'locomotivecms_view_counter'

gemspec = eval(File.read('locomotivecms_view_counter.gemspec'))
Gem::PackageTask.new(gemspec) do |pkg|
  pkg.gem_spec = gemspec
end

desc 'build the gem and release it to rubygems.org'
task release: :gem do
  sh "gem push pkg/locomotivecms_view_counter-#{gemspec.version}.gem"
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')

# RSpec::Core::RakeTask.new('spec:unit') do |spec|
#   spec.pattern = 'spec/unit/**/*_spec.rb'

# end

# RSpec::Core::RakeTask.new('spec:integration') do |spec|
#   spec.pattern = 'spec/integration/**/*_spec.rb'
# end

task default: :spec
