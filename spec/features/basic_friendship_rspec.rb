# frozen_string_literal:true

require 'rails_helper'

RSpec.describe 'User friendship test', type: :feature do
  scenario 'Mutual friendship' do
    User.create!(email: 'diego@email.com', password: '1234567890')
    User.create!(email: 'alberto@email.com', password: '1234567890')
    visit new_user_session_path
    fill_in 'Email', with: 'diego@email.com'
    fill_in 'Password', with: '1234567890'
    click_on 'Log in'
    click_on 'Users'
    click_on 'Add friend'
    expect(page).to have_content('Friend request sent')
    click_on 'Sign out'
    fill_in 'Email', with: 'alberto@email.com'
    fill_in 'Password', with: '1234567890'
    click_on 'Log in'
    expect(page).to have_content('1 pending friend request')
    click_on '1 pending friend request'
    expect(page).to have_content('accept')
    click_on 'accept'
    expect(page).to have_content('Friend accepted')
    click_on 'Sign out'
    fill_in 'Email', with: 'diego@email.com'
    fill_in 'Password', with: '1234567890'
    click_on 'Log in'
    click_on 'Users'
    expect(page).to have_content('Friend')
  end
end
