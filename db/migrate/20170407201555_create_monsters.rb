class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :size
      t.string :type
      t.string :subtype
      t.string :alignment
      t.integer :challenge_rating
      t.string :description
      t.string :speed
      t.integer :armor_class
      t.integer :hit_points
      t.string :hit_dice
    end
  end
end
