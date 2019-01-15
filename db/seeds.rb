# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.where(email: 'admin@example.com').first_or_create!(password: 'password', password_confirmation: 'password')
company = Company.where(name: 'Example').first_or_create!(url: 'example.com')
user = User.where(email: 'demo@example.com').first_or_create!(password: 'password', password_confirmation: 'password', company: company)
user.skip_confirmation!
user.save
def valid_phone
  phone = Phonelib.parse(Faker::PhoneNumber.phone_number)
  if phone.valid?
    phone
  else
    valid_phone
  end
end
if user.contacts.count < 300
  (300 - user.contacts.count).times do
    Contact.create(
      user: user,
      number: valid_phone.e164,
      name: Faker::Name.name,
      email: Faker::Internet.email,
      active: Faker::Boolean.boolean
    )
  end
end
