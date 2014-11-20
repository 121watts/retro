class User < ActiveRecord::Base
  before_save :encrypt_password
  after_save :clear_password

  has_many :feels
  attr_accessor :password

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT, on: :create }
  validates_length_of :password, in: 6..20, on: :create

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def self.authenticate(email = '', password = '')
    user = User.find_by_email(email)

    if user && user.match_password(password)
      return user
    else
      return false
    end
  end

  def match_password(password)
    encrypted_password == BCrypt::Engine.hash_secret(password, salt)
  end

  def clear_password
    self.password = nil
  end
end
