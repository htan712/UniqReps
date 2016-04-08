FactoryGirl.define do
  factory :user do
    name { Faker::StarWars.character}
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
    role 0
  end
end
