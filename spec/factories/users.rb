FactoryGirl.define do
  factory :user do
    name "Bloc"
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    role 0
    confirmed_at Date.today
  end
end
