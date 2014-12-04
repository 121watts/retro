require 'rails_helper'

describe 'Email Processing' do
  it 'receives an email and creates a feel from it' do
    user = build(:user)
    email = build(:email)
    
    page.driver.post email_processor_path, email

    expect(Feel.last.body).to contain("I just have a lot of feels.")  
  end
end
