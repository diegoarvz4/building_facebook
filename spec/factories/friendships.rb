# frozen_string_literal:true

FactoryBot.define do
  factory :friendship do
    confirmed { false }
    user { nil }
    friend { nil }
  end
end
