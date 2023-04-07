class AddDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column :minis, :quantity, :integer, default: 1
    change_column :minis, :description, :string, default: 'No description provided.'
    change_column :minis, :image, :string, default: 'https://vectorified.com/images/meeple-icon-23.png'
  end
end
