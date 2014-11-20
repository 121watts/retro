require 'rails_helper'


describe User, type: :model do

  let(:user) do
    FactoryGirl.create(:user)
  end 

  it 'is valid' do
    expect(user).to be_valid
  end

  it { should have_many(:feels) }

  it { should validate_uniqueness_of(:email) }
  
  it { should allow_value("alice@example.com", "s@e.com").for :email}
  
  it { should_not allow_value("!@#!@!@%$&*(jo.com", "nil").on(:update).for :email }

end
