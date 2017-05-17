class CreateCharacterStats < ActiveRecord::Migration[5.0]
  def change
    create_table :character_stats do |t|
    	t.references :character
    end
  end
end
