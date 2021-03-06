# Set up MongoDB
require 'mongoid'

Mongoid.load!(APP_ROOT.join('config', 'mongoid.yml'), Sinatra::Base.environment.to_sym)
Mongoid.raise_not_found_error = false
Mongoid.logger.level = Logger::INFO
Mongo::Logger.logger.level = Logger::INFO

# Set up the models
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
