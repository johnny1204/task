class Session
  include ActiveModel::Model

  attr_accessor :email, :password, :user

  validates :email, presence: true
  validates :password, presence: true
  validate :check_user, if: ->{ password.present? && email.present? }

  def user
    user = User.find_by(email: email)
    return unless user
    user if user.decrypt_password == password
  end

  private

    def check_user
      errors.add(:user_invalid, 'ユーザーが見つかりません') unless user
    end
end