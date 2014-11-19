class User < ActiveRecord::Base
  has_many :retrospectives
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT, on: :create } 
end
