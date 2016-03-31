require 'bundler'
Bundler.require

DB = Sequel.sqlite('development.sqlite')

Dotenv.load

require './models/business'
require './models/contact'

require './controllers/application_controller'
require './controllers/businesses_controller'

<<<<<<< HEAD
map('/')          { run ApplicationController }
map('/business')  { run BusinessesController }
=======
map('/')         { run ApplicationController }
map('/business') { run BusinessesController }
>>>>>>> e7c0eeab28dc9e80ee63b9746fb259098d6d9bcf
