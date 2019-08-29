require 'rails_helper'


RSpec.describe 'User posting', type: :feature do

   scenario 'login to make a valid post and then make invalid post' do
    user = User.create!(email: 'diego@email.com', password:'1234567890')
    p_content = "This is my post!"
    visit new_user_session_path
    fill_in 'Email', with: 'diego@email.com'
    fill_in 'Password', with: '1234567890'
    click_on 'Log in'
    expect(page).to have_content("Create a post")
    expect(page).to have_content("Timeline")
    
    fill_in 'post_content', with: p_content
    click_on 'Submit'
    expect(page).to have_content("Posted!")
    expect(page).to have_content(p_content)
    fill_in 'post_content', with: ""
    click_on 'Submit'
    expect(page).to have_content("Post should not be empty!")
    
  end 
   
  
end