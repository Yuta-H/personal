class Task < ApplicationRecord
  has_many :task_categories
  has_many :categories, through: :task_categories
  has_many :task_statuses
  has_many :statuses, through: :task_statuses
end
