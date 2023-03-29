class GroupBlueprint < Blueprinter::Base
  identifier :id
  fields :group_name, :user_id, :collection_name
end
