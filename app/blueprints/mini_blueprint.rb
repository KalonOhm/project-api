class MiniBlueprint < Blueprinter::Base
  identifier :id
  fields :mini_name, :subgroup_id, :loadout, :quantity, :description, :created_at, :updated_at, :image
end
