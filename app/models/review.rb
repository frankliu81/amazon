class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :star_count, presence: true,
  inclusion: {in: 0..5, message: "The star value should be between 0 to 5"}

  def user_full_name
      user ? user.full_name : ""
    end

end
