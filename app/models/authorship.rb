class Authorship < ApplicationRecord
  # Direct associations

  belongs_to :authors,
             :class_name => "Author"

  # Indirect associations

  # Validations

end
