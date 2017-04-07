class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.string :damage_dice
      t.integer :damage_bonus
    end
  end
end
