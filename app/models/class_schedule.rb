class ClassSchedule < ApplicationRecord
  # Direct associations

  belongs_to :students,
             :required => false,
             :class_name => "Student"

  belongs_to :courses,
             :class_name => "Course"

  # Indirect associations

  # Validations

end
