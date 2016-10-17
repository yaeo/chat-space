class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #association
  has_many :groups, through: :members, source: :group
  has_many :members
  has_many :messages
end
