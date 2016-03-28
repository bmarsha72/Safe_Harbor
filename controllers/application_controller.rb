class ApplicationController < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  get '/' do
    erb :index
  end

  get '/map' do
    erb :map
  end

  get '/login_register' do
    erb :login_register
  end

end
