class CreateReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :readings do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.boolean :completed, default: false 
      # have a look at default values under migrations.
      t.timestamps
    end
  end
end
