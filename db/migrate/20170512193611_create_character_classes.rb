class CreateCharacterClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :character_classes do |t|
      t.integer :level
      t.boolean :primary
      t.references :klass
      t.references :character
    end
  end
end
