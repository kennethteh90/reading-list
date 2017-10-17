class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.integer :page_number, null: false
      t.string :description, null: false
      t.integer :reading_id, null: false
      t.string :term
      t.timestamps
    end

    add_index :bookmarks, :reading_id
    add_foreign_key :bookmarks, :readings
  end
end
