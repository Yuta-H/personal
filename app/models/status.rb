class Status < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :troubles, dependent: :destroy

  validates :name, presence: true

  scope :user_search, -> (user_id){where(user_id: user_id)}

  scope :branch_tasks, -> (user_id){
    s = where(classification: Constants::TASKS_CLASSIFICATION)
    s = s.where(user_id: user_id)
    s
  }
  scope :branch_troubles, -> (user_id){
    s = where(classification: Constants::TROUBLES_CLASSIFICATION)
    s = s.where(user_id: user_id)
    s
  }
end
