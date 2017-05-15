class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.string :name
      t.string :size
      t.string :race_type
      t.string :subtype
      t.references :sense
    end

    create_table :languages_races, id: false do |t|
      t.belongs_to :race, index: true
      t.belongs_to :language, index: true
    end
  end
end
