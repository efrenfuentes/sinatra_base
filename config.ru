# Require config/environment.rb
require File.expand_path('config/environment', File.dirname(__FILE__))

set :app_file, __FILE__

run Sinatra::Application