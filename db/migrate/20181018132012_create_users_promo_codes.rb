class CreateUsersPromoCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :users_promo_codes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :promo_code, index: true
      t.timestamps
    end
  end
end