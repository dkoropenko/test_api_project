class User < ApplicationRecord

  has_many :users_promo_codes
  has_many :promo_codes, through: :users_promo_codes

  validates :email, uniqueness: true

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def available_courses
    promo_codes.map { |promo_code| promo_code.end_date > Date.today && promo_code.course }
  end
end
