# frozen_string_literal:true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { build(:user) }
  let(:user_2) { build(:user) }
  let(:friendship) { build(:friendship) }

  it 'is invalid without user and friend' do
    expect(friendship).not_to be_valid
  end

  it 'is invalid with user but without friend' do
    friendship.user = user
    expect(friendship).not_to be_valid
  end

  it 'is invalid without user but with friend' do
    friendship.friend = user
    expect(friendship).not_to be_valid
  end

  it 'is valid with user and friend' do
    friendship.friend = user
    friendship.user = user_2
    expect(friendship).to be_valid
  end

  it 'is invalid with friend requesting a user' do
    friendship.user = user
    friendship.friend = user_2
    friendship.save
    friendship2 = Friendship.new
    friendship2.user = user_2
    friendship2.friend = user
    friendship2.valid?
    expect(friendship2.errors[:friendship]).to include('You have a pending request from this user!')
  end
end
