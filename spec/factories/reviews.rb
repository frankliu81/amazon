FactoryGirl.define do
  factory :review do
    product nil
    star_count {rand(5)}
    body { Faker::Hipster.paragraph }
  end
end
