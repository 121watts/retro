class User < ActiveRecord::Base
  after_update :send_welcome_email
  before_validation :format_phone
  has_many :feels

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, format: { with: EMAIL_FORMAT, on: :update }
  validates :email, :phone, presence: true, on: :update
  validates_uniqueness_of :uid, :email
  validates :phone, length: { is: 10}, on: :update

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.save
    end
  end

 def send_welcome_email
   WelcomeMailWorker.perform_async(id)
 end

  def self.create_from_omniauth(auth)
    user = User.new
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.save
    user
  end

  def format_phone
    if self.phone
      self.phone.gsub!(/\D/, '')
    end
  end

  def has_email_and_phone?
    self.email && self.phone
  end

  def feel_for_today
    self.feels.any? do |feel|
      feel.created_at.strftime("%A, %b %d") == Time.new.strftime("%A, %b %d")
    end
  end

end
