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

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'nicoledelarosa616@gmail.com',
  password: 'monkey324'
  )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Property.count} properties created"
puts "#{Tenant.count} tenants created"







