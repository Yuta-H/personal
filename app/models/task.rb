class Task < ApplicationRecord
  has_many :categories
  has_many :statuses
  belongs_to :user
end
