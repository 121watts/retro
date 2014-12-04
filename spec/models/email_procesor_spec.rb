require 'rails_helper'

describe 'Email Processing' do
  it 'creates a feel from an email' do
    create(:user)
    email = build(:email)
    
    EmailProcessor.new(email).process

    expect(Feel.last.body).to eq("I just have a lot of feels.")  
  end
end
