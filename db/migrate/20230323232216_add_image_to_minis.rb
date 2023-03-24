class AddImageToMinis < ActiveRecord::Migration[7.0]
  def change
    add_column :minis, :image, :string
  end
end
