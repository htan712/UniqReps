FactoryGirl.define do
  factory :user do
    name { Faker::StarWars.character}
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    role 0
    confirmed_at Time.now
    after(:create) { |user| user.confirm! }
  end
end
