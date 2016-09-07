require 'sinatra'

get '/' do
  { "test": 1323 }.to_json
end
