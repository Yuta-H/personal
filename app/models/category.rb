class Category < ApplicationRecord
  has_many :troubles
  has_many :tasks
end


