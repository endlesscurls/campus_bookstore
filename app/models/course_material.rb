class CourseMaterial < ApplicationRecord
  # Direct associations

  belongs_to :book

  belongs_to :course,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
