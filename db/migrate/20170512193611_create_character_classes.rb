class CreateCharacterClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :character_classes do |t|
      t.string :name
      t.integer :level
      t.references :character
    end
  end
end
