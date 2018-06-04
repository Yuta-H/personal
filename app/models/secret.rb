class Secret < ApplicationRecord
  has_many :login_ids
  has_many :passwords
end
