class AddMonsterRefToSavingThrows < ActiveRecord::Migration[5.0]
  def change
    add_column :saving_throws, :monster, :reference
  end
end
