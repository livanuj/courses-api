FactoryBot.define do
  factory :course do
    name { Faker::ProgrammingLanguage.name }
    self_assignable { Faker::Boolean.boolean }
    coach { create(:coach) }
  end
end
