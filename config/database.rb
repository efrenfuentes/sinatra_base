# Set up MongoDB
require 'mongoid'

Mongoid.load!(APP_ROOT.join('config', 'mongoid.yml'), Sinatra::Base.environment.to_sym)

# Set up the models
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }