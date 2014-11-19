require 'rails_helper'

describe 'signing up' do

  before(:each) { @user = FactoryGirl.create(:user) }

  context 'before creating an account' do
    it 'comes to the right page' do
      visit '/'
      expect(page).to have_content 'Sign Up'
    end

    it 'can create an account' do
      visit '/'
      fill_in('user[email]', with: @user.email)
      fill_in('user[password]', with: 'password')
      fill_in('user[password_confirmation]', with: 'password')

      click_on("Signup")
      expect(User.all.count).to eq 1
    end

    it 'gets redirected to retro index' do 
      visit '/'
      fill_in('user[email]', with: "joe@example.com")
      fill_in('user[password]', with: 'password')
      fill_in('user[password_confirmation]', with: 'password')

      click_on("Signup")
      expect(current_path).to eq retrospectives_path
    end
  end
end
