class Mini < ApplicationRecord
  belongs_to :subgroup

  has_one :paint_scheme, dependent: :destroy
  has_many :paint_scheme_paints, through: :paint_schemes

  validates :mini_name, :loadout, :quantity, :description, :subgroup_id, presence: true
end
