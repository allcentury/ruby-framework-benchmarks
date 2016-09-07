require 'hanami/router'
require 'json'

app = Hanami::Router.new do
  get '/', to: ->(env) { [200, {}, [JSON.generate({"test": 123})]] }
end

Rack::Server.start app: app, Port: 9292

