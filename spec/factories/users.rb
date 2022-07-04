FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5) }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password(min_length: 8) }
  end
end
