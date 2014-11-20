require 'rails_helper'

describe 'first time login' do
  context 'right after loggin in' do
    before(:each) do
      login
    end

    it 'can enter email and phone number in form' do
      fill_in('user[email]', with: "watts@yermahm.com")
      fill_in('user[phone]', with: "3038675309")
    end

    it 'can submit the form and email/phone are saved' do 
      fill_in('user[email]', with: "watts@yermahm.com")
      fill_in('user[phone]', with: "3038675309")
      click_button 'Feel'
      
      expect(current_path).to eq feels_path
      expect(User.last.email).to eq "watts@yermahm.com" 
      expect(User.last.phone).to eq "3038675309"
    end

    it 'does not see form if user has phone and email' do
      fill_in('user[email]', with: "watts@yermahm.com")
      fill_in('user[phone]', with: "3038675309")
      click_button 'Feel'

      expect(page).to_not have_content('Phone')
      expect(current_path).to eq feels_path
    end 
  end
end
