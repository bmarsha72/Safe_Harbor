require 'dotenv/tasks'

desc "Set up the environment"
task :environment do
  ENV['RACK_ENV'] ||= 'development'
<<<<<<< HEAD
  # might want to put database connection stuff in here later
=======
>>>>>>> e7c0eeab28dc9e80ee63b9746fb259098d6d9bcf
end

namespace :server do
  desc "Start the server"
  task :start => [:environment] do
    system "rerun rackup"
  end
end
