class Message < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :group

  #validation
  validates :body, presence: true
end
