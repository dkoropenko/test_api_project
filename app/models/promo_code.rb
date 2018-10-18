class PromoCode < ApplicationRecord

  has_many :users_promo_codes
  has_many :users, through: :users_promo_codes

  belongs_to :course

  def start_date
    created_at
  end

  def end_date
    created_at + days.days
  end
end
