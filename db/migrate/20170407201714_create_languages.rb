class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :name
    end

    create_table :characters_languages, id: false do |t|
      t.belongs_to :language, index: true
      t.belongs_to :character, index: true
    end
  end
end
