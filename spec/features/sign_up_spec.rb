require 'rails_helper'

describe 'signing up' do

  context 'before creating an account' do
    it 'comes to the right page' do
      visit root_path
      expect(page).to have_css 'div.intro_text'
    end

    it 'can create an account' do
      visit root_path
      fill_in('user[email]', with: 'joe@example.com')
      fill_in('user[password]', with: 'password')

      click_on("Signup")
      expect(User.all.count).to eq 1
    end

    it 'gets redirected to retro index' do
      visit root_path
      fill_in('user[email]', with: "joe@example.com")
      fill_in('user[password]', with: 'password')

      click_on("Signup")
      expect(current_path).to eq retrospectives_path
    end
  end
end
