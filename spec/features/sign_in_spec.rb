require 'rails_helper'

describe 'singing in as an existing user' do
  before(:each) { @user = FactoryGirl.create(:user) }

  it 'gets redirected to retro index when returning to site' do
    visit user_signin_path
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: @user.password)

    click_on("Signin")
    expect(current_path).to eq retrospectives_path
  end
end
