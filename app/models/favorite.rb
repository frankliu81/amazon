class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  # combination of user_id and product_id
  validates :user_id, uniqueness: {scope: :product_id}
end
