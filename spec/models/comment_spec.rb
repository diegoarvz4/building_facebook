# frozen_string_literal:true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { build(:post) }
  let(:user) { build(:user) }
  let(:comment) { build(:comment) }

  it 'is invalid without author and without post' do
    expect(comment).not_to be_valid
  end

  it 'is invalid without author and with post' do
    comment.post = post
    expect(comment).not_to be_valid
  end

  it 'is invalid without post and with author' do
    comment.author = user
    comment.post = nil
    expect(comment).not_to be_valid
  end

  it 'is valid with post and author' do
    comment.author = user
    comment.post = post
    expect(comment).to be_valid
  end
end
