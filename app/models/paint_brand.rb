class PaintBrand < ApplicationRecord
  has_many :paints , dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
