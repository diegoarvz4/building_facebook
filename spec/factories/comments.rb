FactoryBot.define do
  factory :comment do
    content { "MyString" }
    author { nil }
    post { nil }
  end
end
