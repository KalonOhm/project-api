class Mini < ApplicationRecord
  belongs_to :user
  belongs_to :collection, through: :group
  belongs_to :group, through: :subgroup
  belongs_to :subgroup

  has_one :paint_scheme
  has_many :paint_scheme_paints, through: :paint_schemes
end
