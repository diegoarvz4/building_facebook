# frozen_string_literal:true

require 'rails_helper'

RSpec.describe 'User posting, commenting and liking', type: :feature do
  scenario 'login to make a valid post and then make invalid post. Finally post a comment' do
    User.create!(email: 'diego@email.com', password: '1234567890')
    p_content = 'This is my post!'
    visit new_user_session_path
    fill_in 'Email', with: 'diego@email.com'
    fill_in 'Password', with: '1234567890'
    click_on 'Log in'
    expect(page).to have_content('Create a post')
    expect(page).to have_content('Timeline')
    fill_in 'post_content', with: p_content
    click_on 'Create'
    expect(page).to have_content('Posted!')
    expect(page).to have_content(p_content)
    fill_in 'post_content', with: ''
    click_on 'Create'
    expect(page).to have_content('Post should not be empty!')
    fill_in 'comment_content', with: 'My comment'
    click_on 'send'
    expect(page).to have_content('Comment added')
    click_link 'like-link'
    expect(page).to have_content('Liked!')
  end
end
