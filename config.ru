require 'bundler'
Bundler.require

DB = Sequel.sqlite('development.sqlite')

require './models/business'

require './controllers/application_controller'
require './controllers/businesses_controller'

map('/'){ run ApplicationController }
map('/businesses'){ run BusinessesController }
