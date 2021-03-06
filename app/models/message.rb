class Message < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :group

  #validation
  validates :body, presence: true

  #image uploader
  mount_uploader :image, ImageUploader
end
