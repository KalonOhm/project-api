class CreatePaintSchemes < ActiveRecord::Migration[7.0]
  def change
    create_table :paint_schemes do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
