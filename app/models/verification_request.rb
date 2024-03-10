class VerificationRequest < ApplicationRecord
  mount_uploader :id_image, IdImageUploader
  belongs_to :user
  enum status: [:pending, :approved, :rejected]
end
