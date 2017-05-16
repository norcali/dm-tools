class CreateProficiencies < ActiveRecord::Migration[5.0]
  def change
    create_table :proficiencies do |t|
      t.string :skill
      t.reference :character
      t.boolean :expertise
    end
  end
end
