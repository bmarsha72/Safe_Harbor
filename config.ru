require 'bundler'
Bundler.require

# heroku provides a ENV var called ENV['DATABASE_URL']
if ENV['DATABASE_URL']
  DB = Sequel.connect(ENV['DATABASE_URL'])
else
  DB = Sequel.sqlite('development.sqlite')
end

Dotenv.load

require './models/business'
require './models/contact'

require './controllers/application_controller'
require './controllers/businesses_controller'

map('/')         { run ApplicationController }
map('/business') { run BusinessesController }
