class Member < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :group

  #validation
  validates :user_id, presence: true
  validates :group_id, presence: true
end
