class CreateAbilityItems < ActiveRecord::Migration[5.0]
  def change
    create_table :ability_items do |t|
      t.string :name
      t.boolean :proficiency
      t.boolean :expertize
      t.references :ability
    end
  end
end
