# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodosController do
  let!(:user) { User.create!(email: 'foo@bar.org', todos: [todo]) }
  let!(:todo) { Todo.new(title: 'Foo', description: 'Baz') }

  describe "PUT /todos/:id" do
    it 'returns 200' do
      put :update, params: {id: todo.id, todo: {title: 'New title'}}

      body = JSON.parse(response.body)
      expect(body).to eq('ok' => true)

      expect(todo.reload)
        .to have_attributes(title: 'New title')

      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /todos/:id" do
    it 'returns 200' do
      delete :destroy, params: {id: todo.id}

      body = JSON.parse(response.body)
      expect(body).to eq('ok' => true)

      expect(Todo.find_by(id: todo.id)).to be_nil

      expect(response.status).to eq(200)
    end
  end
end
