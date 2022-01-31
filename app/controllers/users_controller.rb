class UsersController < ApplicationController
  def todos
    user = User.find_by(email: params[:email])

    if user
      render json: {ok: true, todos: user.todos}
    else
      render json: {ok: false}, status: 404
    end
  end
end
