class CreateKlasses < ActiveRecord::Migration[5.0]
  def change
    create_table :klasses do |t|
    	t.string :type
    	t.string :specialization
    	t.integer :hit_die
    	t.string :saving_throw_proficiency_1
    	t.string :saving_throw_proficiency_2
    end

    create_table :features_klasses, id: false do |t|
      t.belongs_to :klass, index: true
      t.belongs_to :feature, index: true
    end
  end
end
