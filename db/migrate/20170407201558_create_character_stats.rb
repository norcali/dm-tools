class CreateCharacterStats < ActiveRecord::Migration[5.0]
  def change
    create_table :character_stats do |t|
    	t.references :saving_throw
    	t.references :skill
    end
  end
end
