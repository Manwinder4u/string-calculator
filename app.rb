require "sinatra"
require "sinatra/base"
require_relative "string_calculator"


set :bind, '0.0.0.0'
set :protection, except: [:host]

class App < Sinatra::Base
  set :bind, "0.0.0.0"
  set :protection, except: [:host]
  
  get "/add" do
    numbers = params["numbers"] || ""
    result = StringCalculator.add(numbers)
    result.to_s
  end
end

App.run! if __FILE__ == $0