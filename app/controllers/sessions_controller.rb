class SessionsController < ApplicationController
	def create
	  user = User.from_omniauth(request.env["omniauth.auth"])
		flash[:error] = "Not a valid Synerzip employee!" unless user 
	  session[:user_id] = user&.id
	  redirect_to root_path
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_path
	end
end
