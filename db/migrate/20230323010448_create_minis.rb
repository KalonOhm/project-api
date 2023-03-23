class CreateMinis < ActiveRecord::Migration[7.0]
  def change
    create_table :minis do |t|
      t.references :user, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.references :subgroup, null: false, foreign_key: true
      t.string :mini_name
      t.string :loadout
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end
