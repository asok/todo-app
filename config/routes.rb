Rails.application.routes.draw do
  resources :todos, only: [:update, :destroy]

  get 'users/todos' => 'users#todos'
end
