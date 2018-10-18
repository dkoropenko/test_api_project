class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :label
      t.string :theme

      t.timestamps
    end
  end
end
