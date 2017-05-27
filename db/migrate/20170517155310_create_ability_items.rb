class CreateAbilityItems < ActiveRecord::Migration[5.0]
  def change
    create_table :ability_items do |t|
      t.string :name
      t.boolean :proficiency, default: false, null: false
      t.boolean :expertize, default: false, null: false
      t.references :ability
    end
  end
end
