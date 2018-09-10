class Secret < ApplicationRecord
  validates :name, :password,
            presence: true,
            uniqueness: { allow_blank: true }

  before_save :encrypt_password

  def encrypt_password
    self.password = encrypt(self.password)
  end

  # 暗号化
  def encrypt(password)
    crypt = ActiveSupport::MessageEncryptor.new(Constants::SECURE, Constants::CIPHER)
    crypt.encrypt_and_sign(password)
  end

end
