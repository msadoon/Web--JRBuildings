class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

   def index
    redirect_to root_url

  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    redirect_to root_url
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => "Logged in!"
  	else
  		flash.now.alert = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Logged out!"
  end

end
