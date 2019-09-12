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
end
