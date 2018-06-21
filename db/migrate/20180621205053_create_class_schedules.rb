class CreateClassSchedules < ActiveRecord::Migration
  def change
    create_table :class_schedules do |t|
      t.integer :courses_id
      t.integer :students_id

      t.timestamps

    end
  end
end
