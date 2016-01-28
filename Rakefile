require 'rspec/core'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

task :default => :spec

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec)

desc "Run all features"
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
  # t.cucumber_opts = "features --format html > features.html"
end

desc "Console"
task :console do
  require './config/environment'
  require 'pry'
  ARGV.clear
  Pry.start
end
