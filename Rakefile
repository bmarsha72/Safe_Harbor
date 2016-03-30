require 'dotenv/tasks'

desc "Set up the environment"
task :environment do
  ENV['RACK_ENV'] ||= 'development'
  # might want to put database connection stuff in here later
end

namespace :server do
  desc "Start the server"
  task :start => [:environment] do
    system "rerun rackup"
  end
end
