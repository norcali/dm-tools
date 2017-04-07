class CreateSpecialAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :special_abilities do |t|
      t.string :name
      t.string :description
      t.integer :attack_bonus
    end
  end
end
