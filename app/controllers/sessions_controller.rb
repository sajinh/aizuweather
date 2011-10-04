class SessionsController < ApplicationController
  def new
  	@title = "Sign In"
	end

  def create
		user = User.authenticate(params[:session][:name],params[:session][:password])
		if user.nil?
			flash.now[:error] = "Couldn't Sign In."
			@title = "Sign In"
			render 'new'
		else
			session[:user] = user.id
			redirect_to user
		end
  end

  def destroy
		reset_session
		redirect_to new_session_path 
  end

end