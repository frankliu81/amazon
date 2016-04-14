FactoryGirl.define do
  factory :product do
    sequence(:title) {|n| "#{Faker::Company.bs}-#{n}" }
    description      { Faker::Hipster.paragraph       }
    price            { 11 + rand(100)              }
    sale_price        { 11 + rand(100)              }

  end
end
