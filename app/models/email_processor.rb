class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    user = User.find_by(email: @email.from[:email])
    puts "Received email from: #{@email.from[:email]}"
    if user
      Feel.create!({ user_id: user.id, body: @email.body })
    end
  end
end
