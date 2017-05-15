class CreateBackgrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :backgrounds do |t|
      t.string :name
      t.string :skill_proficiency_1
      t.string :skill_proficiency_2
    end
  end
end
