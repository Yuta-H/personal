class Status < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :troubles, dependent: :destroy

  validates :name, presence: true

  scope :branch_tasks, -> {where(classification: Constants::TASKS_CLASSIFICATION)}
  scope :branch_troubles, -> {where(classification: Constants::TROUBLES_CLASSIFICATION)}
end
