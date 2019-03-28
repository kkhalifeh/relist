# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# users = 30.times do
#   name = Faker::Name.name
#   email = Faker::Internet.email
#   User.create({name: "#{name}", email: "#{email}", password: "password"}) end


# Listing.destroy_all
# 50.times do
# listing = Listing.create({
#     value: Faker::Number.number(4),
#     price: Faker::Number.number(3),
#     guest: rand(1...6),
#     seller_id: rand(1...32),
#     title: Faker::Address.city,
#     check_in: Faker::Date.forward(20),
#     check_out: Faker::Date.forward(30),
#     description: Faker::Lorem.paragraph(30)
#         })
#   img = rand(2...18)
#   listing.photo.attach(io: File.open("app/assets/images/img#{img}.jpg"), filename: "img#{img}.jpg", content_type: 'image/jpg')
# end

User.all.each do |user|
    img = rand(2...18)
    user.profile_photo.attach(io: File.open("app/assets/images/img#{img}.jpg"), filename: "img#{img}.jpg", content_type: 'image/jpg')
end