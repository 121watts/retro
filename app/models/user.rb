class User < ActiveRecord::Base
  has_many :retrospectives
end
