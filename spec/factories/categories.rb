require 'faker'

FactoryBot.define do
  factory :category do |f|
    f.title { Faker::Lorem.characters(number: 10) }
  end
end
