class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.integer :books_id
      t.integer :authors_id

      t.timestamps

    end
  end
end
