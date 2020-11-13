FactoryBot.define do
  # We can choose the name, however FactoryBot will guess the correct model if 
  # naming convention is followed
  factory :user do
    username { Faker::JapaneseMedia::OnePiece.character }
    password  { "starwars" }
    location factory: :location
  end
end