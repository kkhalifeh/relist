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

# User.all.each do |user|
#     img = rand(2...18)
#     user.profile_photo.attach(io: File.open("app/assets/images/img#{img}.jpg"), filename: "img#{img}.jpg", content_type: 'image/jpg')
# end

listing1 = Listing.create({
    value: Faker::Number.number(4),
    price: Faker::Number.number(3),
    guest: rand(1...6),
    seller_id: rand(1...32),
    title: "Fiji Beach Resort",
    check_in: Faker::Date.forward(20),
    check_out: Faker::Date.forward(30),
    description: "The Outrigger Fiji Beach Resort is a deluxe 5 star resort with a beachfront location on Fiji's famous Coral Coast. Offering fantastic facilities including one of the largest freshwater swimming pools in the South Pacific & the stunning Bebe Spa this resort is ideal for both couples and families. Outrigger Fiji Beach Resort has a great Kids Stay and Eat Free offer for stays of 4 nights or more and is the perfect destination for a relaxing and memorable holiday."
        })
listing1.photo.attach(io: File.open("app/assets/images/holiday1.jpg"), filename: "holiday1.jpg", content_type: 'image/jpg')

listing2 = Listing.create({
      value: Faker::Number.number(4),
      price: Faker::Number.number(3),
      guest: rand(1...6),
      seller_id: rand(1...32),
      title: "Fiji Denarau Island",
      check_in: Faker::Date.forward(20),
      check_out: Faker::Date.forward(30),
      description: "Radisson Blu Resort Fiji Denarau Island is a Fiji holiday destination with a superb range of resort activities and facilities from water sports to golf and a range of dining and entertainment options. This Fiji accommodation offers the ideal location to base yourself for you next Fiji holiday with family, friends or as a couple. The kids will love the kid's club and kid's pool whilst adults can relax in the day spa or laze by the adult's only pool.

      This package includes:

      Meet & Greet with Shell lei garland at Nadi Airport
      Return Coach Transfers - Nadi Airport to Radisson Blu Resort Fiji
      6 nights : Garden View Guest Room : Radisson Blu Resort Fiji Denarau Island
      Buffet Breakfast daily
      Bonus F$500 Food & Beverage Credit
      Bonus Kids Stay Free (0-12 years)
      Bonus Kids Eat Free (0-12 years)
      Bonus Free Kids Club Session Per Day (4-12 years)
      Bonus 20% discount at Harmony Retreat Day Spa
      Free WiFi
      Return Flights from Sydney to Nadi including all taxes and baggage allowance per person
      Flights from Melbourne, Brisbane & Adelaide also available - click on Instant Quote to change your departure city
      Kids Fly Return from $99 *T&C’s apply"
          })
listing2.photo.attach(io: File.open("app/assets/images/holiday2.jpg"), filename: "holiday2.jpg", content_type: 'image/jpg')
