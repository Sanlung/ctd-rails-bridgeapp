require 'faker'

FactoryBot.define do
  factory :category do |f|
    f.title { Faker::Lorem.characters(numer: 8) }
  end
end
