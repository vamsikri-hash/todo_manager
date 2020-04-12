class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    if current_user
      redirect_to todos_path
    else
      render "new"
    end
  end

  def create
    user = User.create!(first_name: params[:first_name],
                        last_name: params[:last_name],
                        email: params[:email],
                        password: params[:password])
    session[:current_user_id] = user.id
    redirect_to root_path
  end
end
