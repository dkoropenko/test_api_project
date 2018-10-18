class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.belongs_to :course
      t.string :label
      t.string :description

      t.timestamps
    end
  end
end
