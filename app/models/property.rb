class Property < ActiveRecord::Base
  has_many :tenants
end
