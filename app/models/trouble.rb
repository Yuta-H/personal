class Trouble < ApplicationRecord
  has_many :statuses
  belongs_to :user
end
