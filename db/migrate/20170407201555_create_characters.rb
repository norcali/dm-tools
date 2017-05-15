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
      t.references :race
      t.references :sense
      t.references :background
      t.references :skill
      t.references :saving_throw
      t.references :ability
    end
  end
end
