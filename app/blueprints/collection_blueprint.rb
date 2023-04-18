class CollectionBlueprint < Blueprinter::Base
  identifier :id
  fields :collection_name, :created_at, :updated_at, :user_id, :groups

  view :expand do
    association :groups, blueprint: GroupBlueprint, default: nil
  end
end


