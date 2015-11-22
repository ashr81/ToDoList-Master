class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:user][:username])
  	password = params[:user][:password]
  	if user && user.authenticate(password)
  		session[:user_id] = user.id
  		redirect_to root_path, notice: "Logged in successfully"
  	else
  		redirect_to login_path, alert: "You username/password is not correct"
  	end
  end

  def destroy
  	reset_session
  	redirect_to login_path notice: "successfully Logged Out"
  end
end
