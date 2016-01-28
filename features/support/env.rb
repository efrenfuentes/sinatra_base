require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'rspec'
require 'capybara/rspec'
require 'rack'
require 'rack/test'

ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../../config/environment", __FILE__)

Capybara.app = Sinatra::Application
