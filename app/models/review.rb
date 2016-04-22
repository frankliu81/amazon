class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users,  through: :likes


  validates :star_count, presence: true,
  inclusion: {in: 1..5, message: "The star value should be between 1 to 5"}

  validates :body, presence: true

  def user_full_name
      user ? user.full_name : ""
  end

  def like_for(user)
    likes.find_by_user_id user if user
  end

end
