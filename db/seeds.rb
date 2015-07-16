require 'faker'

# Create Properties
50.times do
  Property.create!(
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

puts "Seed finished"
puts "#{Property.count} properties created"
puts "#{Tenant.count} tenants created"







