class Course < ApplicationRecord
  # Direct associations

  has_many   :class_schedules,
             :foreign_key => "courses_id",
             :dependent => :nullify

  has_many   :course_materials,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
