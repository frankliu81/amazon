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
categories_count = all_categories.count
#u = FactoryGirl.create(:user, password: 'bu', password_confirmation: 'bu')
# u = FactoryGirl.create(:user, :password => 'hello', :password_confirmation => 'hello')
# create! will raise an error on validation failure
# u = User.create!(email: 'frankliu81@gmail.com', first_name: 'Franky', last_name: 'Liu', password: 'bu', password_confirmation: 'bu')

admin_user = User.create(first_name: 'Admin', last_name: 'Admin',
              email: 'admin@admin.com', password: 'admin',
              password_confirmation: 'admin', admin: true)

frank = User.create(first_name: 'Frank', last_name: 'Liu',
              email: 'frankliu81@gmail.com', password: 'bu',
              password_confirmation: 'bu')

frank2 = User.create(first_name: 'Franky', last_name: 'Liu',
              email: 'frankliu82@gmail.com', password: 'bu',
              password_confirmation: 'bu')

10.times do
  #prod = FactoryGirl.create(:product)

  prod = Product.new FactoryGirl.attributes_for(:product).merge({user_id: frank.id})

  #byebug
  3.times do
    r = prod.reviews.new FactoryGirl.attributes_for(:review)
    r.user = frank
    r.save
  end

  ###random_category = all_categories[rand(cateogories_count).floor]
  random_category = all_categories.sample
  #puts random_category.id
  prod.category = random_category
  #prod.user = u
  #prod.valid?
  #puts prod.errors.inspect
  #puts "hello"
  prod.save
  #puts prod

end
