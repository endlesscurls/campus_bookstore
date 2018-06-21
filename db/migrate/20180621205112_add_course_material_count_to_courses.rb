class AddCourseMaterialCountToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :course_materials_count, :integer
  end
end
