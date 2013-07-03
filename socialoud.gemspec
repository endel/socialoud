Gem::Specification.new do |s|
  s.name = 'socialoud'
  s.version = '0.1.3'
  s.summary = 'Simple social aggregation tool written in Ruby.'
  s.homepage = "http://github.com/endel/socialoud"

  s.author = 'Endel Dreyer'
  s.email = 'endel.dreyer@gmail.com'
  s.files = %w(LICENSE) + Dir.glob("{lib}/**/*")
  s.require_path = "lib"

  s.add_runtime_dependency "twitter",    ">= 4.0.0"
  s.add_runtime_dependency "github_api", "~> 0.6.4"
  s.add_runtime_dependency "nokogiri",   "~> 1.5.0"
  s.add_runtime_dependency "httparty",   "~> 0.8.0"
  s.add_runtime_dependency "sinatra",    "~> 1.3.1"

  s.description = <<description
  Simple social aggregation written in Ruby.
  With this gem you can create your custom social network overview.
description
end
