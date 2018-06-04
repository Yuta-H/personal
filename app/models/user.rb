class User < ApplicationRecord
  has_many :passwords
  has_many :login_ids
  has_many :tasks
  has_many :troubles
end
