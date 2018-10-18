class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.belongs_to :course
      t.float :cost

      t.timestamps
    end
  end
end
