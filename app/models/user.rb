class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, uniqueness: VALID_EMAIL_REGEX

  has_secure_password
  has_many :products, dependent: :nullify
  has_many :reviews, dependent: :nullify

  def full_name
    "#{first_name} #{last_name}"
  end

end
