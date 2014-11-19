class User < ActiveRecord::Base
  before_save :encrypt_password
  after_save :clear_password
  
  has_many :retrospectives
  attr_accessor :password 

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT, on: :create } 
  validates :password, confirmation: true
  validates_length_of :password, in: 6..20, on: :create

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
