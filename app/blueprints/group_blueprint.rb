class GroupBlueprint < Blueprinter::Base
  identifier :id
  fields :group_name, :collection_id, :subgroups
end
