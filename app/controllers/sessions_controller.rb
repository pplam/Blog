class SessionsController < ApplicationController
  def new
  end

  def create
	  if user = User.authenticate(params[:name], params[:password])
		  session
  end

  def destroy
  end
end
