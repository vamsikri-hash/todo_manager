class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    if current_user
      flash[:notice] = "You have already signed in, Signout and signin to other account"
      redirect_to todos_path
    else
      render "new"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    password = params[:password]
    if user && user.authenticate(password)
      session[:current_user_id] = user.id
      redirect_to todos_path
    else
      flash[:alert] = "Incorrect email or password, please try again!"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    flash[:success] = "Successfully logged out..!"
    redirect_to root_path
  end
end
