FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    sequence(:userid) { |n| "User#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password  { "password" }
  end
end
