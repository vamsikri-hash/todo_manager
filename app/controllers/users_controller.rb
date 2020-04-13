class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    if current_user
      flash[:notice] = "You have already signed in ,Signout and signup for another account"
      redirect_to todos_path
    else
      render "new"
    end
  end

  def create
    user = User.new(first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    password: params[:password])
    if user.save
      session[:current_user_id] = user.id
      redirect_to todos_path
    else
      flash[:alert] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
