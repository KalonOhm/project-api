class PaintScheme < ApplicationRecord
  belongs_to :user
  has_many :paints, through: :paint_scheme_paints, dependent: :destroy

  validates :description, presence: true
end
