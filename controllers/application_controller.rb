class ApplicationController < Sinatra::Base


  set :views, File.expand_path("../../views", __FILE__)
  set :public_folder, File.dirname(__FILE__) + '/../public'

  get '/' do
    erb :index
  end
end
