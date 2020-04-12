class TodosController < ApplicationController
  before_action :find_current_todos

  def index
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_pleasant_string
  end

  def create
    Todo.create!(todo_text: params[:todo_text],
                 due_date: params[:due_date],
                 completed: false,
                 user_id: current_user.id)
    redirect_to todos_path
  end

  def update
    # double bang operator is an aletrnative !!completed
    completed = params[:completed].nil? ? false : true
    @todos.update(params[:id], completed: completed)
    redirect_to todos_path
  end

  def destroy
    todo = @todos.find(params[:id])
    todo.destroy
    redirect_to todos_path
  end

  private

  def find_current_todos
    @todos = current_user.todos
  end
end
