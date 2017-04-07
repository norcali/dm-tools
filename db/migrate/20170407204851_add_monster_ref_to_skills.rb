class AddMonsterRefToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :monster, :reference
  end
end
