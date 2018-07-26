class User < ApplicationRecord
  before_save :password_encrypt

  has_many :images

  class << self
    def encrypt(password)
      crypt = ActiveSupport::MessageEncryptor.new(ENV['RAILS_KEY_MASTER'], 'aes-256-cbc')
      crypt.encrypt_and_sign(password)
    end
  end

  def password_encrypt
    self.password = User.encrypt(password)
  end

  def decrypt_password
    crypt = ActiveSupport::MessageEncryptor.new(ENV['RAILS_KEY_MASTER'], 'aes-256-cbc')
    crypt.decrypt_and_verify(password)
  end

  def correct_password?(password)
    decrypt_password == password
  end
end
