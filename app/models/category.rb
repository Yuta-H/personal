class Category < ApplicationRecord
  has_many :task_categories
  has_many :trouble_categories
end
