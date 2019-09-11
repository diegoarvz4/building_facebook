# frozen_string_literal:true

FactoryBot.define do
  factory :user do
    email { 'diego@diego.com' }
    password { '123456' }
  end
end
