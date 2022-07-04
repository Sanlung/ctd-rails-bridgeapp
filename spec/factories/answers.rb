FactoryBot.define do
  factory :answer do |f|
    f.content { Faker::Lorem.sentence(word_count: 15) }
    f.question_id { Faker::Number.numer(digits: 1) }
  end
end
