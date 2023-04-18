class SubgroupBlueprint < Blueprinter::Base
  identifier :id
  fields :subgroup_name, :group_id, :minis

  view :expand do
    association :minis, blueprint: MiniBlueprint, default: nil
  end
end
