class UsersController < ApplicationController
  def index
    render plain: User.all.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    render plain: User.find(id).to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    response_text = "hey, new user created with id #{new_user.id}"
    render plain: response_text
  end

  def login
    id = params[:id]
    email = params[:email]
    password = params[:password]
    user = User.find(id)
    if user.email == email && user.password == password
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
