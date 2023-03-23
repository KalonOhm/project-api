class Subgroup < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  belongs_to :group
end
