require 'rails_helper'

describe 'returning user' do
  before(:each) do
    login_as_returning_user
    User.find(User.last.id)
  end

  it 'should not be prompted for email and phone' do
    visit feels_path
    expect(page).to_not have_content "Phone"
  end

  it 'should be able to logout' do
    click_on 'SIGN OUT'
    expect(page).to_not have_content 'SIGN OUT'
    expect(current_path).to eq root_path
  end
end
