# frozen_string_literal:true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:post) { build(:post) }
  let(:user) { build(:user) }
  let(:like) { build(:like) }

  it 'is invalid without author and without post' do
    expect(like).not_to be_valid
  end

  it 'is invalid without author and with post' do
    like.post = post
    expect(like).not_to be_valid
  end

  it 'is invalid without post and with author' do
    like.user = user
    like.post = nil
    expect(like).not_to be_valid
  end

  it 'is valid with post and author' do
    like.user = user
    like.post = post
    expect(like).to be_valid
  end

  it 'is invalid without a unique author and post' do
    like.user = user
    like.post = post
    like.save
    like = Like.new(user_id: user.id, post_id: post.id)
    expect(like.save).to eq(false)
  end
end
