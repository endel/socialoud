require 'rake/gempackagetask'
require 'rake/rdoctask'

VERSION = '0.1'

Gem::Specification.new do |s|
  s.name = 'socialoud'
  s.version = VERSION
  s.summary = 'Simple social aggregation tool written in Ruby.'
  s.homepage = "http://github.com/endel/socialoud"

  s.author = 'Endel Dreyer'
  s.email = 'endel.dreyer@gmail.com'
  s.files = %w(LICENSE) + Dir.glob("{lib}/**/*")
  s.require_path = "lib"

  s.add_dependency "twitter",   "~> 1.7.2"
  s.add_dependency "octopi",    "~> 0.4.5"
  s.add_dependency "nokogiri",  "~> 1.5.0"
  s.add_dependency "httparty",  "~> 0.8.0"
  s.add_dependency "sinatra",   "~> 1.3.1"

  s.description = <<description
  Simple social aggregation written in Ruby.
  With this gem you can create your custom social network overview.
description
end
