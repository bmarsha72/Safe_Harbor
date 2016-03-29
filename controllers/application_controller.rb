class ApplicationController < Sinatra::Base

  @zip_code = ""
  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  get '/' do
    erb :index
  end

  get '/map' do
    erb :map
  end

  get '/business' do
    erb :login_register
  end

  get '/logout' do
    session[:logged_in] = false
    redirect '/'
  end

  post '/search' do
    @zip_code = params[:zipcode]
    erb :results
  end

end
