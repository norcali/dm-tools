class CreateEnvironments < ActiveRecord::Migration[5.0]
  def change
    create_table :environments do |t|
      t.string :name
    end
  end
end
