require 'rails_helper'


RSpec.describe 'Login a user', type: :feature do
   # user = User.create!(name: 'Jon',email:"diego@email.com", password: "1234567890")
    scenario 'login a user with valid name input' do
      
      visit new_user_session_path
      fill_in 'Email', with: 'diego@email.com'
      fill_in 'Password', with: '1234567890'
      click_on 'Log in'
    #  visit new_user_session_path(user)
    #  expect(page).to have_content('Log out')
    end

  
end