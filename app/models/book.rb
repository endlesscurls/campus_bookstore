class Book < ApplicationRecord
  # Direct associations

  has_many   :authorships,
             :foreign_key => "books_id",
             :dependent => :destroy

  has_many   :course_materials,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
