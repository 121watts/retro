describe 'returning user' do
  before(:each) do
    login_as_returning_user
    User.find(User.last.id)
  end  

  it 'should not be promted for email and phone' do    
    visit feels_path
    save_and_open_page
    expect(page).to_not have_content "Phone"    
  end

  it 'should be able to logout' do
    click_on 'Sign Out'
    expect(page).to_not have_content 'Sign Out'
    expect(current_path).to eq root_path
  end
end
