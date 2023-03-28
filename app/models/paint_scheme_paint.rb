class PaintSchemePaint < ApplicationRecord
  belongs_to :paint_scheme
  belongs_to :paint

  validates :paint_scheme_id, :paint_id, :description, presence: true
end
