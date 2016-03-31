class MapsController < ApplicationController

  get '/' do
    redirect '/'
  end

  post '/search' do
    $city_search = params[:city_search]
    @business_match = Business.where(city: params[:city_search].downcase).all
    erb :map
  end

end
