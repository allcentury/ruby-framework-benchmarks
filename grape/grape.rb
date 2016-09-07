require 'grape'
class API < Grape::API
  format :json
  get "/" do
    { "test": 123 }
  end
end
