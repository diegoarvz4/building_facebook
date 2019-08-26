require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with name" do 
    user = User.new(name: "Diego", email: "diego@gmail.fr", password: "Hey12345678") 
    expect(user).to be_valid 
  end 

  it "expects short passwords to be invalid" do
    user = User.new(name: "Diego", email: "diego@gmail.fr", password: "He78") 
    expect(user).not_to be_valid 
  end

  it "expects wrong email formats to be invalid" do
    user = User.new(name: "Diego", email: "diego.gmail.fr", password: "Heey12345678") 
    expect(user).not_to be_valid 
  end

end
