require 'rspec/core'
require 'rspec/core/rake_task'

task :default => :spec

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec)

desc "Console"
task :console do
  require './config/environment'
  require 'pry'
  ARGV.clear
  Pry.start
end