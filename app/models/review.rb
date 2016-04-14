class Review < ActiveRecord::Base
  belongs_to :product

  validates :star_count, presence: true,
  inclusion: {in: 0..5, message: "The star value should be between 0 to 5"}

end
