class Group < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  has_many :subgroups, dependent: :destroy
  has_many :minis, through: :subgroups

  validates :group_name, presence: true
  validates :group_name, uniqueness: { scope: :collection_id, message: "already exists in this collection" }

end
