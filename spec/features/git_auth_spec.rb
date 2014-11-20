require 'rails_helper'

describe 'signing into the service' do
  context 'as a new user' do
    it 'can sign in with github' do
      visit signin_path
      expect(page).to have_content "Sign in with GitHub"
      click_on("Sign in with GitHub")
      
      expect(current_path).to eq feels_path
    end

    it 'it prompts me for email and phone after signing in' do

    end

    it 'i can enter email and phone' do

    end

    it 'i cannot just enter email' do

    end

    it 'i cannot just enter phone' do

    end
  end

end
