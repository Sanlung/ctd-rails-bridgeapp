FactoryBot.define do
  factory :question do |f|
    f.content { Faker::Lorem.sentence(word_count: 15) }
    f.category { FactoryBot.create(:category) }
    f.user { FactoryBot.create(:user) }
  end
end
