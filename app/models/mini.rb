class Mini < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  belongs_to :group
  belongs_to :subgroup
end
