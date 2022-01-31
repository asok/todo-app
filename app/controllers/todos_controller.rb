class TodosController < ApplicationController
  def update
    if todo
      update!
    else
      render json: {ok: false}, status: 404
    end
  end

  def destroy
    if todo
      todo.destroy

      render json: {ok: true}
    else
      render json: {ok: false}, status: 404
    end
  end

  protected

  def todo
    @todo = Todo.find(params[:id])
  end

  def permitted_params
    params.require(:todo).permit(:title, :description)
  end

  def update!
    if todo.update(permitted_params)
      render json: {ok: true}
    else
      render json: {ok: false, errors: todo.errors.to_h}, status: 400
    end
  end
end
