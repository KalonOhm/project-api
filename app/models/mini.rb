class Mini < ApplicationRecord
  # belongs_to :user
  # belongs_to :collection, through: :group
  # belongs_to :group, through: :subgroup
  belongs_to :subgroup

  has_one :paint_scheme, dependent: :destroy
  has_many :paint_scheme_paints, through: :paint_schemes

  validates :mini_name, :loadout, :quantity, :description, presence: true, :subgroup_id, :collection_id, :group_id, :user_id, presence: true
  validates :mini_name, uniqueness: { scope: :subgroup_id, message: "already exists in this subgroup" }

end
