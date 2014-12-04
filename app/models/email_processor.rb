class EmailProcessor
  def self.process(email)
    user = User.where(email: email.from)
    
    Feel.create!({ user_id: user.id, body: email.body })
  end
end
