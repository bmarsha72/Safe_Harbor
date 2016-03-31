require 'dotenv/tasks'
require 'bundler'

# heroku provides a ENV var called ENV['DATABASE_URL']
desc "Set up the environment"
task :environment do
  ENV['RACK_ENV'] ||= 'development'
  if ENV['DATABASE_URL']
    Bundler.require(:default, :production)
    DB = Sequel.connect(ENV['DATABASE_URL'])
  else
    Bundler.require(:default, :development)
    DB = Sequel.sqlite('development.sqlite')
  end
end

namespace :server do
  desc "Start the server"
  task :start => [:environment] do
    system "rerun rackup"
  end
end

namespace :db do
  desc 'Migrate'
  task :migrate => [:environment] do
    Sequel.extension :migration
    Sequel::Migrator.run(DB, "migrations/")
  end
end
