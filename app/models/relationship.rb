class Relationship < ApplicationRecord

  belongs_to :user
  belongs_to :relationship, :class_name => 'User'
end
