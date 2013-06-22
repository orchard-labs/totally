require File.join(File.dirname(__FILE__), '..', 'server.rb')

require 'sinatra'
require 'rack/test'

# setup test environment
TotallyOrchard::Main.set :environment, :test
TotallyOrchard::Main.set :run, false
TotallyOrchard::Main.set :raise_errors, true
TotallyOrchard::Main.set :logging, false

def app
  TotallyOrchard::Main
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
