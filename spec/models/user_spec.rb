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

  it 'returns true when checking if it has a feel for today with today\'s date' do
    feel = FactoryGirl.create(:feel)
    feel.user_id = user.id
    feel.save

    expect(user.feel_for_today).to eq true
  end

  it 'returns false when checking if it has a feel for today not today\'s date' do
    feel = FactoryGirl.create(:feel)
    feel.user_id = user.id
    feel.created_at = Date.new
    feel.save

    expect(user.feel_for_today).to eq false
  end
end
