class Group < ApplicationRecord
  #association
  has_many :users, through: :members, sorce: :user
end
