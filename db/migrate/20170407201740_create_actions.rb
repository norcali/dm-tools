class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
    	t.string :name
      t.string :damage_dice
      t.integer :damage_bonus
      t.integer :range
      t.string :damage_type
      t.references :character
    end
  end
end
