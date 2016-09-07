require "nancy"
require 'json'

class API < Nancy::Base
  get "/" do
    JSON.generate({"test": 123})
  end
end
