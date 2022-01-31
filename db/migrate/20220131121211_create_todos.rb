class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
