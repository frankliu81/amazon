class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  # combination of user_id and review_id
  validates :user_id, uniqueness: {scope: :review_id}

end
