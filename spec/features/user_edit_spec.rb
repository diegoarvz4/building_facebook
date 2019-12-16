# frozen_string_literal:true

require 'rails_helper'

RSpec.describe 'User profile', type: :feature do
  scenario 'valid update ' do
    user = User.create!(email: 'diego@email.com', password: '1234567890')
    visit new_user_session_path
    fill_in 'Email', with: 'diego@email.com'
    fill_in 'Password', with: '1234567890'
    click_on 'Log in'
    visit user_path(user)
    expect(page).to have_content('City')
    click_on 'Edit Profile'
    new_name = 'Mister Goku'
    fill_in 'Name', with: 'Mister Goku'
    click_on 'Update'
    expect(page).to have_content(new_name)
  end

  scenario 'invalid update ' do
    User.create!(email: 'diego@email.com', password: '1234567890')
    another_user = User.create!(email: 'another@email.com', password: '1234567890')
    visit new_user_session_path
    fill_in 'Email', with: 'diego@email.com'
    fill_in 'Password', with: '1234567890'
    click_on 'Log in'
    visit user_path(another_user)
    expect(page).not_to have_content('Edit profile')
  end
end
