class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    user = User.where(email: @email.from)
    
    Feel.create!({ user_id: user.id, body: @email.body })
  end
end
