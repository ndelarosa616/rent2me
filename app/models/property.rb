class Property < ActiveRecord::Base
  has_many :tenants
  belongs_to :user

  mount_uploader :image, ImageUploader
end
