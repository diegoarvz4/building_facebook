# frozen_string_literal:true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is valid with name' do
    expect(user).to be_valid
  end

  it 'expects short passwords to be invalid' do
    user.password = '123'
    expect(user.save).to eq(false)
  end

  it 'expects wrong email formats to be invalid' do
    user.email = 'diego.gmail.fr'
    expect(user.save).to eq(false)
  end
end
