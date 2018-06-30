class Status < ApplicationRecord
  has_many :task_statuses
  has_many :task
  has_many :trouble
  has_many :trouble_statuses
end
