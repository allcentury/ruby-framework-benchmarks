require 'sinatra'
require 'json'

get '/' do
  JSON.generate({ "test": 1323 })
end
