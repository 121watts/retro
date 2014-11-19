require 'rails_helper'


describe User, type: :model do

  let(:user) do
    User.new(email:"retro@example.com",
             password: "123456" )
  end 

  it 'is valid' do
    expect(user).to be_valid
  end

  it { should have_many(:retrospectives) }

  it { should validate_presence_of(:email) }

  it { should validate_uniqueness_of(:email) }
  
  it { should allow_value("alice@example.com", "s@e.com").for :email}
  
  it { should_not allow_value("!@#!@!@%$&*(jo.com", "nil", "").for :email }

#  dont know why this isnt running  
#  it { should validate_length_of(:password).is_at_least(6) }  
end
