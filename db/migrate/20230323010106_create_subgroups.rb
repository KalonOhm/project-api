class CreateSubgroups < ActiveRecord::Migration[7.0]
  def change
    create_table :subgroups do |t|
      t.references :user, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.string :subgroup_name

      t.timestamps
    end
  end
end
