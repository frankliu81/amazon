class Product < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  belongs_to :category
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :users,  through: :favorites

  # http://stackoverflow.com/questions/1550688/how-do-i-create-a-default-value-for-attributes-in-rails-activerecords-model
  #before_validation :default_values
  after_initialize :default_values

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates_numericality_of :price
  validates :sale_price, presence: true, numericality: {less_than_or_equal_to: :price }

  def onsale?
    sale_price < price
  end

  def user_full_name
    user ? user.full_name : ""
  end

  def category_name
    category ? category.name : ""
  end

  def favorite_for(user)
    favorites.find_by_user_id user if user
  end

  private

  def default_values
    #puts "price: #{price}"
    self.sale_price ||= price
  end


end
