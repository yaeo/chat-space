class Group < ApplicationRecord
  #association
  has_many :users, through: :members, source: :user
  has_many :messages
  has_many :members
  accepts_nested_attributes_for :members

  #validation
  validates :name, presence: true
end
