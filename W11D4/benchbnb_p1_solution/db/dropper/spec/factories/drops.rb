FactoryBot.define do
  factory :drop do
    body { Faker::ChuckNorris.fact }
    association :author, factory: :user
  end
end