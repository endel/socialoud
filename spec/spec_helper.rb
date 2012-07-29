# encoding: utf-8
$: << File.dirname(__FILE__) << 'lib'

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

ENV['ENVIRONMENT'] = 'test'
require 'socialoud'
