require 'dotenv/tasks'

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
