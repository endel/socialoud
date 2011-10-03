require 'rake/gempackagetask'
require 'rake/rdoctask'

VERSION = '0.1'

Gem::Specification.new do |s|
  s.name = 'socialoud'
  s.version = VERSION
  s.summary = 'Your customizable single-page social overview.'
  s.homepage = "http://github.com/endel/socialoud"

  s.author = 'Endel Dreyer'
  s.email = 'endel.dreyer@gmail.com'
  s.files = %w(LICENSE) + Dir.glob("{lib}/**/*")
  s.require_path = "lib"

  s.description = <<description
  With this gem you can easily customize your social network overview.
description
end
