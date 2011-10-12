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

  s.description = <<description
  Simple social aggregation written in Ruby.
  With this gem you can create your custom social network overview.
description
end
