class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.string :name
      t.string :size
      t.string :type
      t.string :subtype
      t.references :character
    end
  end
end
