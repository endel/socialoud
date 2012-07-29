require 'rubygems'
require 'bundler/setup'
require 'rake'
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--colour']
  t.pattern = 'spec/*_spec.rb'
end

task :default => :spec
