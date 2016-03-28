class BusinessesController < ApplicationController

  post '/register' do
    password = BCrypt::Password.create(params[:password])
    Business.create ({
      username      => params[:username],
      password      => password,
      email         => params[:email],
      phone         => params[:phone],
      address       => params[:address],
      zip           => params[:zip],
      businessname  => params[:businessname]
  })
  end

end
