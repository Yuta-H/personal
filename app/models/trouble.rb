class Trouble < ApplicationRecord
  belongs_to :category
  belongs_to :status
  belongs_to :user

  validates :name, presence: true

  scope :user_search, -> (user_id){where(user_id: user_id)}

end