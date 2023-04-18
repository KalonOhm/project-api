class GroupBlueprint < Blueprinter::Base
  identifier :id
  fields :group_name, :collection_id, :subgroups

  view :expand do
    association :subgroups, blueprint: SubgroupBlueprint, default: nil
  end
end
