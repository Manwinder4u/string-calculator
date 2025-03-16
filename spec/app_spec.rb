require_relative "../spec/spec_helper"

RSpec.describe "String Calculator API", type: :request do
  include Rack::Test::Methods

  def app
    App
  end

  it "returns 0 for an empty input" do
    get "/add", numbers: ""
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq("0")
  end

  it "returns the sum of multiple numbers" do
    get "/add", numbers: "1,2,3,4"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq("10")
  end

  it "handles newlines between numbers" do
    get '/add?numbers=1%0A2,3'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("6")
  end

  it "handles explicit '\\n' as part of input" do
    get '/add?numbers=1\n2,3'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("6")
  end
end