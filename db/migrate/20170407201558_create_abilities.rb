class CreateAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :abilities do |t|
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
    end
  end
end
