class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    password = params[:password]
    if user && user.authenticate(password)
      render plain: "correct password"
    else
      render plain: "Incorrect password"
    end
  end
end
