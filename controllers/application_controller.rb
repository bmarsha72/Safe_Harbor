class ApplicationController < Sinatra::Base

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
    # Do a search if they entered any string
    unless params[:city_search] == ''
      # Search the database for city locations
      location = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?key=' + ENV['MAPS_KEY'] + '&address=' + params[:city_search]
     location = JSON.parse(location.body)
     latitude = location['results'][0]['geometry']['location']['lat'].to_s
     longitude = location['results'][0]['geometry']['location']['lng'].to_s
     p latitude
     p longitude
      erb :results
    else
      #flash message
    end
  end

  not_found do
    "404 - Page not found"
  end

end
