class CreatePaintSchemePaints < ActiveRecord::Migration[7.0]
  def change
    create_table :paint_scheme_paints do |t|
      t.references :paint_scheme, null: false, foreign_key: true
      t.references :paint, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
