FactoryGirl.define do
  factory :recipe do
    title "Chocolate Cookie"
    description "YUm YUM YUM"
    ingredients [FactoryGirl.create(:ingredient)]
    directions [FactoryGirl.create(:direction)]
    image
    user
  end
end
