class Senses < ActiveRecord::Migration[5.0]
  def change
  	create_table :senses do |t|
      t.string :type
    end
  end
end
