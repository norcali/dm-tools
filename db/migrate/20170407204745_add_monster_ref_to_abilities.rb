class AddMonsterRefToAbilities < ActiveRecord::Migration[5.0]
  def change
    add_reference :abilities, :monster, foreign_key: true
  end
end
