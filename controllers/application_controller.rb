class ApplicationController < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  get '/' do
    erb :index
  end

  get '/logout' do
    session[:logged_in] = false
    redirect '/'
  end

  post '/search' do

    @business_match = Business.where(city: params[:city_search].downcase).all
    erb :results

  end

  not_found do
    "404 - Page not found"
  end

end
