require 'rails_helper'

describe 'User entering feel' do
  before(:each) do
    login_as_returning_user
    fill_in('user[email]', with: "watts@yermahm.com")
    fill_in('user[phone]', with: "3038675309")
    click_button 'Feel'
  end

  it 'can see feel input_area' do
    expect(page).to have_css('input.retro_input')
  end

  it 'can save a feel' do
    fill_in('feel[body]', with: "yesterday all my troubles seemed so far away")
    choose 'feel_emoji_5'
    click_button 'Feel'
    expect(page).to have_content('yesterday all my troubles seemed so far away')
  end

  it 'doesn\'t save if blank' do
    Time.new
    choose 'feel_emoji_5'
    click_button 'Feel'
    expect(Feel.all).to eq []
  end

  it 'gets a flash message if feel is NOT saved' do
    visit current_path
    click_button 'Feel'
    expect(Feel.all).to eq []
  end

  it 'gets a flash message if feel is saved' do
    fill_in('feel[body]', with: "yesterday all my troubles seemed so far away")
    choose 'feel_emoji_5'
    click_button 'Feel'
    expect(page).to have_content('Your feel has been saved.')
  end

  it 'gets a flash message if feel is NOT saved' do
    #doesn't fill anything in
    choose 'feel_emoji_5'
    click_button 'Feel'
    expect(page).to have_content('Something went wrong. Please try again.')
  end

  it 'saves a feel with an emoji value' do
    # user = FactoryGirl.create(:user)
    visit feels_path
    fill_in('feel[body]', with: "yesterday all my troubles seemed so far away")
    choose 'feel_emoji_5'
    click_button 'Feel'
    expect(User.last.feels.last.emoji).to eq '5'
  end

  it 'saves a feel without an emoji value (uses default "neutral")' do
    visit feels_path
    fill_in('feel[body]', with: "yesterday all my troubles seemed so far away")
    click_button 'Feel'
    expect(User.last.feels.last.emoji).to eq '4'
  end
end
