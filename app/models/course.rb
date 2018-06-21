class Course < ApplicationRecord
  # Direct associations

  has_many   :course_materials,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
