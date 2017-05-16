class CreateAbilityScores < ActiveRecord::Migration[5.0]
  def change
    create_table :ability_scores do |t|
      t.string :name
      t.integer :value
      t.float :score
      t.references :character_stat
    end
  end

end
