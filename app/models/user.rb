class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :session_token, :password

  #before validations go here
  validates :user_name, :email, :session_token, :password, :presence => true
  validates :user_name, :email, :uniqueness => true

  def generate_session_token
    SecureRandom.base64
  end

  def reset_session_token
    self.session_token = generate_session_token
  end

  def password=(secret)
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
    BCrypt::Password.new(password_digest).is_password?(secret)
  end

  def self.find_by_credentials(email, secret)
    user = User.find_by_email(email)
    return user if user.is_password?(secret)
    nil
  end
end