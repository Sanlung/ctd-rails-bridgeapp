FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
  end
end
