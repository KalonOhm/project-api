class Subgroup < ApplicationRecord
  belongs_to :group
  has_many :minis, dependent: :destroy

  validates :subgroup_name, presence: true
  validates :subgroup_name, uniqueness: { scope: :group_id, message: "already exists in this group" }
  
end
