class Category < ApplicationRecord
  has_many :troubles, dependent: :destroy
  has_many :tasks, dependent: :destroy

  scope :branch_tasks, -> {where(classification: Constants::TASKS_CLASSIFICATION)}
  scope :branch_troubles, -> {where(classification: Constants::TROUBLES_CLASSIFICATION)}
end


