class MiniBlueprint < Blueprinter::Base
  identifier :id
  fields :group_name, :user_id, :collection_name, :subgroup_name, :mini_name, :loadout, :quantity, :description, :created_at, :updated_at, :image
end
