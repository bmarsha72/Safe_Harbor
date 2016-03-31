class MapsController < ApplicationController

  @latitude = ""
  @longitude = ""

  get '/' do
    erb :map
  end

  post '/search' do
    @business_match = Business.where(city: params[:city_search].downcase).all
    erb :map
  end

end
