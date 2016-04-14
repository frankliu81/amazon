class Product < ActiveRecord::Base

  has_many :reviews, dependent: :destroy

  # http://stackoverflow.com/questions/1550688/how-do-i-create-a-default-value-for-attributes-in-rails-activerecords-model
  #before_validation :default_values
  after_initialize :default_values

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :sale_price, presence: true, numericality: {less_than_or_equal_to: :price }

  def onsale?
    sale_price < price
  end

  private

  def default_values
    puts "price: #{price}"
    self.sale_price ||= price
  end


end
