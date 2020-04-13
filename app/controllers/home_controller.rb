class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    if current_user
      flash[:notice] = "You have already signed in.."
      redirect_to todos_path
    else
      render "index"
    end
  end
end
