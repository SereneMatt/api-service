FactoryBot.define do
  factory :expense do
    spent_for { Faker::Lorem.word }
    amount { Faker::Number.decimal }
  end
end