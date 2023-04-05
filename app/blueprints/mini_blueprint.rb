class MiniBlueprint < Blueprinter::Base
  identifier :id
  fields :group_id, :user_id, :collection_id, :subgroup_id, :mini_name, :loadout, :quantity, :description, :created_at, :updated_at, :image
end
