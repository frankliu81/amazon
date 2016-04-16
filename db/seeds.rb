# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
  #Category.create(name: Faker::Hacker.adjective)
  FactoryGirl.create(:category)
end

all_categories = Category.all
cateogories_count = all_categories.count
u = FactoryGirl.create(:user, password: 'bu', password_confirmation: 'bu')
# u = FactoryGirl.create(:user, :password => 'hello', :password_confirmation => 'hello')
# create! will raise an error on validation failure
# u = User.create!(email: 'frankliu81@gmail.com', first_name: 'Franky', last_name: 'Liu', password: 'bu', password_confirmation: 'bu')

10.times do
  p = FactoryGirl.create(:product)

  3.times do
    r = FactoryGirl.create(:review)
    r.user = u
    r.save
    p.reviews.push(r)
    # each not defined for reviews
    #p.reviews = FactoryGirl.create(:review)
  end

  #random_category = all_categories[rand(cateogories_count).floor]
  random_category = all_categories.sample
  p.category = random_category
  p.user = u
  p.save

end
