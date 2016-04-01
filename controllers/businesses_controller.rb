class BusinessesController < ApplicationController

  before do
    if session[:logged_in]
      @current_user = Business[session[:curret_user_id]]
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
      location  = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?key=' + ENV["MAPS_KEY"] + '&address=' + params[:city_search].to_json
      location  = JSON.parse(location.body)
      latitude  = location['results'][0]['geometry']['location']['lat'].to_s
      longitude = location['results'][0]['geometry']['location']['lng'].to_s
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

    @current_user.contact.update({
      :on_location  => params[:on_location],
      :name         => params[:name].downcase,
      :phone        => params[:phone]
    })
    p @current_user
    redirect '/index'
  end

  post '/login' do
    user = Business[:email => params[:email]]
    compare_to = BCrypt::Password.new(user.password)
    if user && compare_to == params[:password]
      session[:logged_in] = true
      session[:current_user_id] = user.id
      # @current_user = Business[session[:current_user_id]]
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



# Creating a business
# @business = Business.create name: 'whatever', another_thing: 'whatever, etc:' 'ok'
#
# # in controller responsible for login/signup
# if @business
# 	session[:logged_in] = true
# 	session[:user_id] = @business.id
# 	puts @business
# 	puts @business.id
# else
# 	"You could not be created"
# end
#
# # Updating a business
# puts @current_user # just to see if it exists
# # Creates a new contact associated with the business
# @current_user.contact.create name: 'whoever', phone: 123456789, etc: 'something'
#
# # Update a Business contact
# @current_user.contact.update name: 'new name', other_attrs: 'whatever'


end
