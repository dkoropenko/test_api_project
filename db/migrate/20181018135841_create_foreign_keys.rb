class CreateForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :lessons, :courses
    add_foreign_key :prices, :courses
    add_foreign_key :promo_codes, :courses

    add_foreign_key :users_promo_codes, :users
    add_foreign_key :users_promo_codes, :promo_codes
  end
end
