class Property < ActiveRecord::Base
  has_many :tenants
  belongs_to :user
end
