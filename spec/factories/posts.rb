# frozen_string_literal:true

FactoryBot.define do
  factory :post do
    author_id { 1 }
    content { '123456' }
  end
end
