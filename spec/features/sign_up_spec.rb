require 'rails_helper'

describe 'signing up' do

  before(:each) { @user = FactoryGirl.create(:user) }

  context 'before creating an account' do
    it 'comes to the right page' do
      visit '/'
      expect(page).to have_content 'enter your email address and password to get started. we\'ll take it from there'

    end

    it 'can create an account' do
      fill_in('Email', with: @user.email)
      fill_in('Password', with: 'password')

      expect(request).to be_ok
    end
  end
end
