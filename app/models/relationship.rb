class Relationship < ApplicationRecord

  belongs_to :user
  belongs_to :follower, class_name: "User"

  validates :follower_id, uniqueness: { scope: :follower_id }
  validates :user_id, uniqueness: { scope: :user_id }
end
