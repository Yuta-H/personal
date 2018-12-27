class Secret < ApplicationRecord
  validates :name, :password,
            presence: true,
            uniqueness: { allow_blank: true }

  before_save :encrypt_password

  scope :user_search, -> (user_id){where(user_id: user_id)}

  def encrypt_password
    self.password = encrypt(self.password)
  end

  # 暗号化
  def encrypt(password)
    crypt = ActiveSupport::MessageEncryptor.new(Constants::SECURE, Constants::CIPHER)
    crypt.encrypt_and_sign(password)
  end

end
