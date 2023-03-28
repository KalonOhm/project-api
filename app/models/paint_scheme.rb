class PaintScheme < ApplicationRecord
  belongs_to :user
  has_many :paints, through: :paint_scheme_paints

  validates :description, presence: true
end
