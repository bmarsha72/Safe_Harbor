class MapsController < ApplicationController

  get '/' do
    redirect '/index'
  end

  post '/search' do
    unless params[:city_search] == ''
      location  = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?key=' + ENV["MAPS_KEY"] + '&address=' + params[:city_search].to_json
      location  = JSON.parse(location.body)
      @latitude  = location['results'][0]['geometry']['location']['lat']
      @longitude = location['results'][0]['geometry']['location']['lng']
    else
      redirect '/index'
    end
    p @latitude
    p @longitude
    
    @business_match = Business.where(city: params[:city_search].downcase).all
    $city_search = params[:city_search]
    erb :map
  end

end
