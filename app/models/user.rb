class User < ActiveRecord::Base
  has_many :feels

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, format: { with: EMAIL_FORMAT, on: :update } 
  validates_uniqueness_of :uid, :email

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider 
      user.uid      = auth.uid
      user.save
    end
  end

  def self.create_from_omniauth(auth)
    user = User.new
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.save
    user
  end
end
