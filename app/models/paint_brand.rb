class PaintBrand < ApplicationRecord
  has_many :paints 

  validates :name, presence: true
  validates :name, uniqueness: true
end
