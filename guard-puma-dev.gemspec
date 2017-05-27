# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/puma_dev/version'

Gem::Specification.new do |s|
  s.name         = "guard-puma-dev"
  s.version      = Guard::PumaDevVersion::VERSION
  s.author       = "Tyler Horan"
  s.email        = "tyler@tylerhoran.com"
  s.summary      = 'Guard plugin for Puma Dev'
  s.description  = 'Guard::PumaDev automatically manage PumaDev applications restart'
  s.homepage     = 'https://rubygems.org/gems/guard-puma-dev'
  s.license      = "MIT"

  s.files        = `git ls-files`.split($/)
  s.test_files   = s.files.grep(%r{^spec/})
  s.require_path = 'lib'

  s.add_dependency 'guard', '~> 2.0'
  s.add_runtime_dependency 'guard-compat', '~> 1.2'
  s.add_development_dependency 'bundler', '>= 1.3.5'
end
