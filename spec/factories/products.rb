FactoryGirl.define do
  factory :product do
    association :user, factory: :user
    sequence(:title) {|n| "#{Faker::Company.bs}-#{n}" }
    description      { Faker::Hipster.paragraph       }
    price            { 11 + rand(100)              }
    sale_price       { price              }
  end
end
