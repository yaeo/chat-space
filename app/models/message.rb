class Message < ApplicationRecord
  #validation
  validates :body, presence: true
end
