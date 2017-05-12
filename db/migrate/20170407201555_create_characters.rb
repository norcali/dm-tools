class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :type
      t.string :name
      t.string :alignment
      t.string :description
      t.string :speed
      t.integer :armor_class
      t.integer :hit_points
    end
  end
end
