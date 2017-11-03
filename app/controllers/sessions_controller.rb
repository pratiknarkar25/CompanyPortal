class SessionsController < ApplicationController
	def create
		p params
		binding.pry
	  user = User.from_omniauth(request.env["omniauth.auth"])
		p '*' * 100
		binding.pry
		flash[:error] = "Not a valid Synerzip employee!" unless user 
	  session[:user_id] = user&.id
	  redirect_to root_path
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_path
	end
end
