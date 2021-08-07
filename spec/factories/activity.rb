FactoryBot.define do
  factory :activity do
    name { Faker::Verb.base } 
    course { create(:course) }
  end
end
