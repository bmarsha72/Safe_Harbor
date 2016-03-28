class BusinessesController < ApplicationController

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

    Contact.create({
    onlocation => params[:onlocation],
    name => params[:name],
    phone => params[:name]
    })
  end

end
