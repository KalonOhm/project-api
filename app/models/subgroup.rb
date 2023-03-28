class Subgroup < ApplicationRecord
  belongs_to :user, through: :collection
  belongs_to :collection, through: :group
  belongs_to :group
  has_many :minis

  validates :subgroup_name, presence: true
  validates :subgroup_name, uniqueness: { scope: :group_id, message: "already exists in this group" }
  
end
