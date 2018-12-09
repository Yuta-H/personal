class Trouble < ApplicationRecord
  belongs_to :category
  belongs_to :status

  validates :name, presence: true

end