class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
    	t.string :type
      t.string :name
    end

    create_table :characters_features, id: false do |t|
      t.belongs_to :character, index: true
      t.belongs_to :feature, index: true
    end

    create_table :features_races, id: false do |t|
      t.belongs_to :race, index: true
      t.belongs_to :feature, index: true
    end

    create_table :features_klasses, id: false do |t|
      t.belongs_to :klass, index: true
      t.belongs_to :feature, index: true
    end
  end
end
