ENV['RACK_ENV'] = 'test'  # Ensures Sinatra runs in test mode

require "rspec"
require "rack/test"
require_relative "../app"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
