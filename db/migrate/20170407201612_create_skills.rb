class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.integer :acrobatics
      t.integer :arcana
      t.integer :animal_handling
      t.integer :athletics
      t.integer :deception
      t.integer :history
      t.integer :insight
      t.integer :intimidation
      t.integer :investigation
      t.integer :history
      t.integer :medicine
      t.integer :nature
      t.integer :perception
      t.integer :performance
      t.integer :persuasion
      t.integer :religion
      t.integer :stealth
      t.integer :slight_of_hand
      t.integer :survival
      t.integer :initiative
    end
  end
end
