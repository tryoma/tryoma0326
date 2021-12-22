class V1::TodosController < ApplicationController
  def index
    todo = Todo.all
    render json: todo
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      render json: todo.errors
    end
    puts params
  end

  def destroy
    todo = Todo.find(params[:id])
    if todo.destroy
      render json: todo
    end
  end

  private

  # ストロングパラメーターの設定
  def todo_params
    params.require(:todo).permit(:title, :user_id)
  end
end
