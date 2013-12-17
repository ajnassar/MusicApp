class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :session_token, :password

  before_validation(:on => :create) do
    reset_session_token
  end

  validates :user_name, :email, :session_token, :password_digest,
            :presence => true
  validates :user_name, :email, :uniqueness => true
  validates :password, :length => {:minimum => 7, :maximum => 15},
            :on => :create

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  def password
    @password
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
    BCrypt::Password.new(password_digest).is_password?(secret)
  end

  def self.find_by_credentials(email, secret)
    user = User.find_by_email(email)
    return nil if user.nil?
    return user if user.is_password?(secret)
  end

  def reset_session_token
    self.session_token = generate_session_token
  end

  def reset_session_token!
    reset_session_token
    self.save!
  end
end