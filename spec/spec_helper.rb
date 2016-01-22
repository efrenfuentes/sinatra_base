# If RACK_ENV isn't set, set it to 'test'.  Sinatra defaults to development,
# so we have to override that unless we want to set RACK_ENV=test from the
# command line when we run rake spec.  That's tedious, so do it here.
ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end

def app
  Sinatra::Application
end