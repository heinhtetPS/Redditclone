class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}
  after_initialize :ensure_token
  attr_reader :password

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def valid_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.valid_password?(password)
    user
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  #I was using SELF here and it messed up the entire auth process while throwing no errors
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def ensure_token
    self.session_token ||= User.generate_session_token
  end

end
