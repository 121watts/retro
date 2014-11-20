require 'rails_helper'

describe 'signing in as an existing user' do
  before(:each) { @user = FactoryGirl.create(:user) }

  it 'can log in and gets redirected to retro index when returning to site' do
    visit signin_path
    fill_in('email', with: @user.email)
    fill_in('password', with: 'password')

    click_on("Signin")
    expect(current_path).to eq feels_path
  end

  it 'cannot log in with invalid credentials' do
    visit new_session_path
    fill_in('email', with: @user.email)
    fill_in('password', with: '3.14159')

    click_on("Signin")
    expect(page).to have_content('Email')
  end
end
