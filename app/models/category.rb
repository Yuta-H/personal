class Category < ApplicationRecord
  has_many :task_statuses
  has_many :trouble_statuses
  has_many :task
  has_many :trouble
end
