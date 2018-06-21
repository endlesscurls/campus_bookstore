class CreateCourseMaterials < ActiveRecord::Migration
  def change
    create_table :course_materials do |t|
      t.integer :book_id
      t.integer :course_id

      t.timestamps

    end
  end
end
