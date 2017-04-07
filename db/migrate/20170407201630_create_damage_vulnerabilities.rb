class CreateDamageVulnerabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :damage_vulnerabilities do |t|
      t.string :type
    end
  end
end
