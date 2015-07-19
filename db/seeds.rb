require 'faker'

# Create Users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Properties
50.times do
  Property.create!(
    user: users.sample,
    name: Faker::Address.street_name,
    address1: Faker::Address.street_address,
    address2: Faker::Address.secondary_address,
    address3: Faker::Address.building_number,
    country: Faker::Address.country,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip_code,
    taxes: Faker::Number.between(2000, 7500),
    rent: Faker::Number.between(500, 2000),
    notes: Faker::Lorem.paragraph
    )
end
properties = Property.all

#Create Tenants
50.times do 
  Tenant.create!(
    property: properties.sample,
    name: Faker::Name.name,
    work_phone: Faker::PhoneNumber.cell_phone,
    mobile_phone: Faker::PhoneNumber.cell_phone,
    home_phone: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    birthday: Faker::Date.backward(36500)
    )
end
tenants = Tenant.all

# Create an admin user
admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!

#Create a property manager
property_manager = User.new(
  name: 'Property Manager User',
  email: 'nicoledelarosa616@gmail.com',
  password: 'monkey324',
  role: 'property_manager'
  )
property_manager.skip_confirmation!
property_manager.save!

# Create a tenant
tenant = User.new(
  name: 'Tenant User',
  email: 'tenant@example.com',
  password: 'helloworld',
  role: 'tenant'
  )
tenant.skip_confirmation!
tenant.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Property.count} properties created"
puts "#{Tenant.count} tenants created"







