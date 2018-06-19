class User < ApplicationRecord
  has_many :passwords
  has_many :login_ids
  has_many :tasks
  has_many :troubles
  scope :password, joins(:passwords).merge(Password.password)
  scope :logon_id, joins(:login_ids).merge(LoginId.authenticate_key)

  has_secure_password validations: true
end
