FactoryBot.define do
  factory :question do |f|
    f.content { Faker::Lorem.sentence(word_count: 15) }
    f.category_id { Faker::Number.numer(digits: 1) }
  end
end
