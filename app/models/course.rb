class Course < ApplicationRecord

  has_many :lessons, dependent: :destroy
  has_many :promo_codes
  has_one :price, dependent: :destroy
end
