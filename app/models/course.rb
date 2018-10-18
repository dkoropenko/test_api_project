class Course < ApplicationRecord

  has_many :promo_codes
  has_many :lessons, dependent: :destroy
  has_one :price, dependent: :destroy

  def available_to?(user:)
    promo_code = user.promo_codes.find_by(course_id: id)

    promo_code.present? && promo_code.end_date > Date.today
  end

  def available_date_to(user:)
    user.promo_codes.find_by(course_id: id)&.end_date
  end
end
