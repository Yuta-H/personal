class Status < ApplicationRecord
  has_many :task_statuses
  has_many :trouble_statuses
end
