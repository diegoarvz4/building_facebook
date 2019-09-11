# frozen_string_literal:true

require 'rails_helper'

RSpec.describe 'User signup', type: :feature do
  scenario 'Invalid sign up with empty values' do
    visit new_user_registration_path
    click_on 'Sign up'
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'Sign up a user with valid email and password' do
    visit new_user_registration_path
    fill_in 'Email', with: 'diego@email.com'
    fill_in 'Password', with: '1234567890'
    fill_in 'Password confirmation', with: '1234567890'
    click_on 'Sign up'
    expect(page).to have_content('Sign out')
  end
end
