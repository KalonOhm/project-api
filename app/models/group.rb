class Group < ApplicationRecord
  belongs_to :user, through: :collection
  belongs_to :collection
  has_many :subgroups
  has_many :minis, through: :subgroups
end
