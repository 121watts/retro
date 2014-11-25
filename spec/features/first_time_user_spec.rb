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

    it 'cannot signup with just an email' do
      fill_in('user[email]', with: "watts@yermahm.com")
      click_button 'Feel'
      expect(page).to have_content "Email"
      expect(page).to have_content "Phone"
      expect(User.last.email).to eq nil
      expect(User.last.phone).to eq nil
    end

    it 'cannot signup with just a phone' do
      fill_in('user[phone]', with: "1234567891")
      click_button 'Feel'
      expect(page).to have_content "Email"
      expect(page).to have_content "Phone"
      expect(User.last.email).to eq nil
      expect(User.last.phone).to eq nil
    end

    it 'cannot signup with an invalid email' do
      fill_in('user[email]', with: "watts@ye")
      fill_in('user[phone]', with: "122344569")
      click_button 'Feel'
      expect(page).to have_content "Email"
      expect(page).to have_content "Phone"
      expect(User.last.email).to eq nil
      expect(User.last.phone).to eq nil
    end

    it 'cannot signup with an invalid phone' do
      fill_in('user[email]', with: "watts@yes.com")
      fill_in('user[phone]', with: "1223fkjasdfh")
      click_button 'Feel'
      expect(page).to have_content "Email"
      expect(page).to have_content "Phone"
      expect(User.last.email).to eq nil
      expect(User.last.phone).to eq nil
    end

    it 'can enter phone with varying formats' do
      fill_in('user[email]', with: "watts@yes.com")
      fill_in('user[phone]', with: "914-420-1223")
      click_button 'Feel'
      expect(page).to have_content "Email"
      expect(page).to have_content "Phone"
      expect(User.last.email).to eq "watts@yes.com"
      expect(User.last.phone).to eq "9144201223"
      
    end
  end
end
