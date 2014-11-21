def login
  visit root_path
  click_on("Sign in with GitHub")
end

def login_as_returning_user
   visit signin_path
   click_on("Sign in with GitHub")
end
