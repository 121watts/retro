class Feel < ActiveRecord::Base
  belongs_to :user
  validates :emoji, presence: true
  validates :body, presence: true

end
