class BusinessesController < ApplicationController

  before do
    if session[:logged_in]
      @current_user = Business[:id => session[:user_id]]
    end
  end

  get '/' do
    if session[:logged_in] == true
      redirect '/business/account'
    else
      erb :login_register
    end
  end

  post '/register' do

    unless params[:username] == ''
      password = BCrypt::Password.create(params[:password])
      @business = Business.create({
        :username      => params[:username],
        :password      => password,
        :email         => params[:email]
        })
        if @business
          session[:logged_in] = true
          session[:user_id] = @business.id
        else
    	     "You could not be created"
        end
          redirect '/business/account'
      end
      "You must enter a username"
  end

  post '/update' do
    unless params[:city] == ''
      location  = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?key=' + ENV["MAPS_KEY"] + '&address=' + params[:city].to_json
      location  = JSON.parse(location.body)
      latitude  = location['results'][0]['geometry']['location']['lat']
      longitude = location['results'][0]['geometry']['location']['lng']
    else
      #flash message
    end
    # find the one to update
    @current_user.update({
      :phone          => params[:phone],
      :address        => params[:address].downcase,
      :zip            => params[:zip],
      :city           => params[:city].downcase,
      :business_name  => params[:business_name].downcase,
      :latitude       => latitude,
      :longitude      => longitude
    })
    if @current_user.contact == nil
      @current_user.contact = Contact.create({
        :on_location  => params[:on_location],
        :name         => params[:name].downcase,
        :phone        => params[:phone]
        })
      else
        @current_user.contact.update({
          :on_location  => params[:on_location],
          :name         => params[:name].downcase,
          :phone        => params[:phone]
        })
      end
    redirect '/index'
  end

  post '/login' do
    user = Business[:email => params[:email]]
    compare_to = BCrypt::Password.new(user.password)
    if user && compare_to == params[:password]
      session[:logged_in] = true
      session[:_user_id] = user.id
      # @current_user = Business[session[:current_user_id]]
      redirect '/business/account'
    else
      redirect '/business'
    end
  end

  get '/account' do
    if session[:logged_in] == true
      erb :account
    else
      redirect '/business'
    end
  end

end
