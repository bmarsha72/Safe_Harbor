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
<<<<<<< HEAD
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
=======
    @business_match = Business.where(city: params[:city_search].downcase).all
    erb :results
>>>>>>> e7c0eeab28dc9e80ee63b9746fb259098d6d9bcf
  end

  not_found do
    "404 - Page not found"
  end

end
