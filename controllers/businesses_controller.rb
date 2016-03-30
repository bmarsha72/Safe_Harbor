class BusinessesController < ApplicationController

  get '/' do
    if session[:logged_in] == true
      redirect '/business/account'
    else
      erb :login_register
    end
  end

  post '/register' do
    password = BCrypt::Password.create(params[:password])
    user = Business.create({
      :username      => params[:username],
      :password      => password,
      :email         => params[:email]
    })
    contact = Contact.create({
      :name => ""
    })
    session[:logged_in] = true
    session[:email]  = session[:email]
    redirect '/'
  end

  post '/update' do
    unless params[:city] == ''
      location  = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?key=' + ENV["MAPS_KEY"] + '&address=' + params[:city_search].to_json
      location  = JSON.parse(location.body)
      latitude  = location['results'][0]['geometry']['location']['lat'].to_s
      longitude = location['results'][0]['geometry']['location']['lng'].to_s
    else
      #flash message
    end
    # binding.pry
    # find the one to update
    @business = Business[session[:current_user_id]]
    @business.update({
      :phone          => params[:phone],
      :address        => params[:address].downcase,
      :zip            => params[:zip],
      :city           => params[:city].downcase,
      :business_name  => params[:business_name].downcase,
      :latitude       => latitude,
      :longitude      => longitude
    })
    @contact = Contact[session[:current_user_id]]
    @contact.update({
      :on_location  => params[:on_location],
      :name         => params[:name].downcase,
      :phone        => params[:phone]
    })
    p '---------------------'
    p 
    p '---------------------'
    redirect '/'
  end

  post '/login' do
    user = Business[:email => params[:email]]
    compare_to = BCrypt::Password.new(user.password)
    if user && compare_to == params[:password]
      session[:logged_in] = true
      session[:current_user_id] = user[:id]
      redirect '/business/account'
    else
      redirect '/business'
    end
  end

  get '/logout' do
    session[:logged_in] = false
    redirect '/'
  end

  get '/account' do
    if session[:logged_in] == true
      erb :account
    else
      redirect '/business'
    end
  end

end
