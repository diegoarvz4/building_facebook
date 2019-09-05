require 'rails_helper'


RSpec.describe 'User session test', type: :feature do
   # user = User.create!(name: 'Jon',email:"diego@email.com", password: "1234567890")
    scenario 'login a user with valid email and password input and then logout' do
      user = User.create!(email: 'diego@email.com', password:'1234567890')
      visit new_user_session_path
      fill_in 'Email', with: 'diego@email.com'
      fill_in 'Password', with: '1234567890'
      click_on 'Log in'
      expect(page).to have_content('Sign out')
      click_on 'Sign out'
      expect(page).to have_content('Signed out successfully')
    end

  
end