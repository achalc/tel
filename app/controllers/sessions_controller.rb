require 'pry'

class SessionsController < ApplicationController
	
	def create
    koala_user = User.koala(request.env['omniauth.auth']['credentials'])
    user = User.login(koala_user, env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to index_url
	end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
