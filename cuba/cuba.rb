require "cuba"
require "cuba/safe"
require 'json'

Cuba.use Rack::Session::Cookie, :secret => "__a_very_long_string__"

Cuba.plugin Cuba::Safe

Cuba.define do
  on get do
    on "hello" do
      res.write "Hello world!"
    end

    on root do
      res.write JSON.generate({ "test": 123 })
    end
  end
end
