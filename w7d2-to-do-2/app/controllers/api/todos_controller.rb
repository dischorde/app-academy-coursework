class Api::TodosController < ApplicationController
  before_action :find_param, only: [:show, :update, :destroy]

  def show
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def index
    @todos = Todo.all
    render json: @todos
  end

  def update
    if @todo.update_attributes(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def destroy
    @todo.destroy
    render json: @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done);
  end

  def find_param
    @todo = Todo.find(params[:id])
  end
end
