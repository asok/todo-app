# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do
  let!(:user) { User.create!(email: 'foo@bar.org', todos: [todo]) }
  let!(:todo) { Todo.new(title: 'Foo', description: 'Baz') }

  describe "GET /todos" do
    context 'user present' do
      it 'returns 200' do
        get :todos, params: {email: user.email}

        body = JSON.parse(response.body)
        expect(body).to eq('ok' => true, 'todos' => [{'title' => todo.title, 'description' => todo.description}])

        expect(response.status).to eq(200)
      end
    end

    context "user missing" do
      it 'returns 404' do
        get :todos, params: {email: '0'}

        body = JSON.parse(response.body)
        expect(body).to eq('ok' => false)

        expect(response.status).to eq(404)
      end
    end
  end
end
