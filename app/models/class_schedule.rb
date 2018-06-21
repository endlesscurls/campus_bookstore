class ClassSchedule < ApplicationRecord
  # Direct associations

  belongs_to :courses,
             :class_name => "Course"

  # Indirect associations

  # Validations

end
