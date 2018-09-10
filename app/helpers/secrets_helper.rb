module SecretsHelper

  #pass復号化
  def decrypt(password)
    crypt = ActiveSupport::MessageEncryptor.new(Constants::SECURE, Constants::CIPHER)
    crypt.decrypt_and_verify(password)
  end
end
