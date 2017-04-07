class CreateDamageInmunities < ActiveRecord::Migration[5.0]
  def change
    create_table :damage_inmunities do |t|
      t.string :type
    end
  end
end
