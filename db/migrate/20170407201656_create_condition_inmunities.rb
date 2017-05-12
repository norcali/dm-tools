class CreateConditionInmunities < ActiveRecord::Migration[5.0]
  def change
    create_table :condition_inmunities do |t|
      t.string :type
      t.references :character
      t.references :race
    end
  end
end
