class CreateDamageResistances < ActiveRecord::Migration[5.0]
  def change
    create_table :damage_resistances do |t|
      t.string :type
    end
  end
end
