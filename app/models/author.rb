class Author < ApplicationRecord
  # Direct associations

  has_many   :authorships,
             :foreign_key => "authors_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
