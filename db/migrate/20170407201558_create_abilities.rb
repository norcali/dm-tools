class CreateAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :abilities do |t|
    	t.string :ability_type
      t.integer :value
      t.integer :score
      t.references :character_stat
    end
  end
end
