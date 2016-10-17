class Group < ApplicationRecord
  #association
  has_many :users, through: :members, source: :user
  has_many :members
  accepts_nested_attributes_for :members
end
