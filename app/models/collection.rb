class Collection < ApplicationRecord
  belongs_to :user
  has_many :groups 
  has_many :subgroups, through: :groups 
  has_many :models, through: :subgroups
end
