class Subgroup < ApplicationRecord
  belongs_to :user, through: :collection
  belongs_to :collection, through: :group
  belongs_to :group
  has_many :minis
end
