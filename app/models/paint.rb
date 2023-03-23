class Paint < ApplicationRecord
  belongs_to :paint_brand
  has_many :paint_schemes, through: :paint_scheme_paints 
  
end
