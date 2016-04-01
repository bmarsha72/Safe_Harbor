class ApplicationController < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  get '/' do
    erb :home, layout: :layout_home
  end

  get '/home' do
    erb :home
  end

  get '/index' do
    erb :index
  end

  get '/about' do
    erb :aboutus
  end

  get '/logout' do
    session[:logged_in] = false
    redirect '/index'
  end

  not_found do
    "404 - Page not found"
  end

end
