class RemoveAssociations < ActiveRecord::Migration[7.0]
  def change
    remove_column :minis, :collection_id
    remove_column :minis, :group_id
    remove_column :minis, :user_id
    remove_column :groups, :user_id
    remove_column :subgroups, :user_id
    remove_column :subgroups, :collection_id
  end
end
