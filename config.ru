require 'bundler'
Bundler.require

DB = Sequel.sqlite('development.sqlite')

Dotenv.load

require './models/business'
require './models/contact'

require './controllers/application_controller'
require './controllers/businesses_controller'

map('/') { run ApplicationController }
map('/business') { run BusinessesController }
