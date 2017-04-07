class CreateSavingThrows < ActiveRecord::Migration[5.0]
  def change
    create_table :saving_throws do |t|
      t.integer :strength_save
      t.integer :dexterity_save
      t.integer :constitution_save
      t.integer :intelligence_save
      t.integer :wisdom_save
      t.integer :charisma_save
    end
  end
end
