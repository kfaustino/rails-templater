# -*- encoding: utf-8 -*-
require File.expand_path("../lib/rails_templater/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rails_templater"
  s.version     = RailsTemplater::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kevin Faustino"]
  s.email       = ["kevin.faustino@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/rails_templater"
  s.summary     = "Template generator for Ruby on Rails 3 applications"
  s.description = "Template generator for Ruby on Rails 3 applications"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rails_templater"

  s.add_dependency "rails", "~> 3.1"
  s.add_development_dependency "bundler", "~> 1.0"
  s.add_development_dependency("rspec", ["~> 2.8"])

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
