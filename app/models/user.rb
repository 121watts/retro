class User < ActiveRecord::Base
  has_many :retrospectives

  validates :email, presence: true
end
