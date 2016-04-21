FactoryGirl.define do
  factory :review do
    association :product, factory: :product
    association :user, factory: :user
    star_count { 1 + rand(4)}
    body { Faker::Hipster.paragraph }
  end
end
