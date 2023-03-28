class Paint < ApplicationRecord
  belongs_to :paint_brand
  has_many :paint_schemes, through: :paint_scheme_paints 

  validates :name, :paint_brand_id, :description presence: true
  validates :name, uniqueness: { scope: :paint_brand_id, message: "already exists in this paint brand" }
  
  
end
