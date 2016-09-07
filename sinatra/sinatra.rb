require 'sinatra'
require 'json'

get '/' do
  JSON.generate({ "test": 123 })
end
