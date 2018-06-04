class Status < ApplicationRecord
  belongs_to :task
  belongs_to :trouble
end
