# frozen_string_literal:true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }
  let(:user) { build(:user) }

  it 'is valid with author' do
    post.author = user
    post.save
    expect(post).to be_valid
  end

  it 'is invalid without content' do
    post.content = nil
    post.save
    expect(post).not_to be_valid
  end

  it 'is invalid without author' do
    post.author = nil
    post.save
    expect(post).not_to be_valid
  end
end
