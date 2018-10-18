class CreatePromoCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :promo_codes do |t|
      t.belongs_to :course
      t.string :identifier
      t.integer :lessons_size
      t.integer :days

      t.timestamps
    end
  end
end
