require 'dotenv/tasks'
require 'bundler'

# heroku provides a ENV var called ENV['DATABASE_URL']
if ENV['DATABASE_URL']
  Bundler.require(:default, :production)
  DB = Sequel.connect(ENV['DATABASE_URL'])
else
  Bundler.require(:default, :development)
  DB = Sequel.sqlite('development.sqlite')
end


desc "Set up the environment"
task :environment do
  ENV['RACK_ENV'] ||= 'development'
end

namespace :server do
  desc "Start the server"
  task :start => [:environment] do
    system "rerun rackup"
  end
end

namespace :db do
  desc 'Migrate'
  task :migrate do
    require './migrations/001_setup'
  end
end
