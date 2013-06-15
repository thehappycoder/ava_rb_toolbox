# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "ava_rb_toolbox"
  gem.required_ruby_version = '>= 2.0.0'
  gem.homepage = "http://github.com/thehappycoder/ava_rb_toolbox"
  gem.license = "MIT"
  gem.summary = "Small useful additions to ruby standard classes"
  gem.description = ""
  gem.email = "thehappycoder@gmail.com"
  gem.authors = ["Anton Kuzmin"]
  # dependencies defined in Gemfile

  gem.files.exclude 'spec/**/*'
  gem.files.exclude 'Rakefile', '.document', '.yardopts', 'Gemfile', 'Gemfile.lock'
end
Jeweler::RubygemsDotOrgTasks.new

task :default => :test