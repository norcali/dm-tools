class CreateSavingThrows < ActiveRecord::Migration[5.0]
  def change
    create_table :saving_throws do |t|
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
    end
  end
end
