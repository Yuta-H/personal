class Trouble < ApplicationRecord
  has_many :trouble_categories
  has_many :categories, through: :trouble_categories
  has_many :trouble_statuses
  has_many :statuses, through: :trouble_statuses
end