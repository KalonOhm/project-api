class MiniBlueprint < Blueprinter::Base
  identifier :id
  fields :subgroup_id, :mini_name, :loadout, :quantity, :description, :created_at, :updated_at, :image
end
