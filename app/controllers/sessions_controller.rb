class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    password = params[:password]
    if user && user.authenticate(password)
      session[:current_user_id] = user.id
      redirect_to todos_path
    else
      render plain: "Incorrect password"
    end
  end
end