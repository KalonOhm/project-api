class CreatePaints < ActiveRecord::Migration[7.0]
  def change
    create_table :paints do |t|
      t.references :paint_brand, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
