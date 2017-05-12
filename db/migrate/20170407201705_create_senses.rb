class CreateSenses < ActiveRecord::Migration[5.0]
  def change
  	create_table :senses do |t|
      t.string :type
      t.references :race
    end
  end
end
