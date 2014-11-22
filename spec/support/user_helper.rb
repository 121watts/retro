def login
  visit root_path
  click_on("Sign in with GitHub")
end

def login_as_returning_user
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      :provider => 'github',
      :uid => '123545'
    })
   visit root_path 
   click_on("Sign in with GitHub")
   user = User.find(User.last.id)
   user.email = "j@j.com"
   user.phone = "3031112222"
   user.save
end
