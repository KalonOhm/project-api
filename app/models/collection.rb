class Collection < ApplicationRecord
  belongs_to :user
  has_many :groups, dependent: :destroy

  validates :collection_name, presence: true
  validates :collection_name, uniqueness: { scope: :user_id, message: "already exists in this collection" }

end
