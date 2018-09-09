class Category < ApplicationRecord
  has_many :troubles, dependent: :destroy
  has_many :tasks, dependent: :destroy

  scope :branch_tasks, -> {where(classification: 1)}
  scope :branch_troubles, -> {where(classification: 2)}
end


