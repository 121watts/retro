require 'rails_helper'

describe 'User entering feel' do
  before(:each) do
    login
    visit feels_path
    fill_in('user[email]', with: "watts@yermahm.com")
    fill_in('user[phone]', with: "3038675309")
    click_button 'Feel'
  end

  it 'can see feel input_area' do
    expect(page).to have_css('div.feel_input')
  end

  it 'can save a feel' do
    fill_in('feel[body]', with: "yesterday all my troubles seemed so far away")
    click_button 'Create Feel'
    expect(page).to have_content('yesterday all my troubles seemed so far away')
  end

  it 'doesn\'t save if blank' do
    #doesn't fill anything in
    Date.new
    click_button 'Create Feel'
    expect(Feel.all).to eq []
  end

  it 'gets a flash message if feel is saved' do
    fill_in('feel[body]', with: "yesterday all my troubles seemed so far away")
    click_button 'Create Feel'
    expect(page).to have_content('Your retro has been saved.')
  end

  it 'gets a flash message if feel is NOT saved' do
    #doesn't fill anything in
    click_button 'Create Feel'
    expect(page).to have_content('Something went wrong. Please try again.')
  end
end
