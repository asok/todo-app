class Todo < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :description

  def as_json(*)
    super(only: [:title, :description])
  end
end
