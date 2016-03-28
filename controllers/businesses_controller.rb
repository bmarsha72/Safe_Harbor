class BusinessesController < ApplicationController

  get '/' do
    erb :index
  end

  post '/register' do
    password = BCrypt::Password.create(params[:password])
    Business.create({
    username => params[:username],
    password => password,
    email => params[:email],
    phone => params[:phone],
    address => params[:address],
    zip => params[:zip],
    businessname => params[:businessname]
  })

    session[:logged_in] = true
    session[:username] = params[:username]

    Contact.create({
    onlocation => params[:onlocation],
    name => params[:name],
    phone => params[:name]
    })
  end



  post '/login' do
    user = Business[username: params[:username]]
    compare_to = BCrypt::Password.new(user.password)
      if compare_to == params[:password]
        session[:logged_in] = true
        session[:username] = params[:username]
        "Welcome back #{params[:username]}!"
      else
        "sorry, wrong password"
      end
  end

  get '/logout' do
    session[:logged_in] = false
    @user_message = "You are now logged out. Come back soon."
    redirect '/'
  end

end
