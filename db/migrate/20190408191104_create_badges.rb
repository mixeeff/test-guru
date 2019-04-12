class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :filename
      t.string :rule_type
      t.integer :rule_value

      t.timestamps
    end
  end
end
