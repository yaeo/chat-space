class Group < ApplicationRecord
  #association
  has_many :users, through: :members, sorce: :user
  has_many :members
end
