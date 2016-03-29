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

    puts '_--------------------------'
    puts params
    user = Business.create({
      :username      => params[:username],
      :password      => password,
      :email         => params[:email],
      # :phone         => params[:phone],
      # :address       => params[:address],
      # :zip           => params[:zip],
      # :businessname  => params[:businessname]
    })
    # contact = Contact.create({
    #   :onlocation => params[:onlocation],
    #   :name       => params[:name],
    #   :phone      => params[:name]
    # })
    session[:logged_in] = true
    session[:email]  = session[:email]
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
