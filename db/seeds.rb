require 'faker'

# User.destroy_all
#
# (1..10).each do |num|
#   user = User.create({
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: "password",
#     })
#   user.profile_photo.attach(io: File.open("app/assets/images/profile_photos/pp#{num}.png"), filename: "pp#{num}.jpg", content_type: 'image/png')
# end

#
# listing1 = Listing.create({
#     value: Faker::Number.number(4),
#     price: Faker::Number.number(3),
#     guest: rand(1...6),
#     seller_id: rand(1...10),
#     title: "Fiji Beach Resort",
#     check_in: "Thu, 28 Mar 2019",
#     check_out: Faker::Date.forward(30),
#     description: "The Outrigger Fiji Beach Resort is a deluxe 5 star resort with a beachfront location on Fiji's famous Coral Coast. Offering fantastic facilities including one of the largest freshwater swimming pools in the South Pacific & the stunning Bebe Spa this resort is ideal for both couples and families. Outrigger Fiji Beach Resort has a great Kids Stay and Eat Free offer for stays of 4 nights or more and is the perfect destination for a relaxing and memorable holiday."
#         })
# listing1.photo.attach(io: File.open("app/assets/images/holiday1.jpg"), filename: "holiday1.jpg", content_type: 'image/jpg')
#
# listing2 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Fiji Denarau Island",
#       check_in: "Thu, 28 Mar 2019",
#       check_out: Faker::Date.forward(30),
#       description: "Radisson Blu Resort Fiji Denarau Island is a Fiji holiday destination with a superb range of resort activities and facilities from water sports to golf and a range of dining and entertainment options. This Fiji accommodation offers the ideal location to base yourself for you next Fiji holiday with family, friends or as a couple. The kids will love the kid's club and kid's pool whilst adults can relax in the day spa or laze by the adult's only pool.
#
#       This package includes:
#
#       Meet & Greet with Shell lei garland at Nadi Airport
#       Return Coach Transfers - Nadi Airport to Radisson Blu Resort Fiji
#       6 nights : Garden View Guest Room : Radisson Blu Resort Fiji Denarau Island
#       Buffet Breakfast daily
#       Bonus F$500 Food & Beverage Credit
#       Bonus Kids Stay Free (0-12 years)
#       Bonus Kids Eat Free (0-12 years)
#       Bonus Free Kids Club Session Per Day (4-12 years)
#       Bonus 20% discount at Harmony Retreat Day Spa
#       Free WiFi
#       Return Flights from Sydney to Nadi including all taxes and baggage allowance per person
#       Flights from Melbourne, Brisbane & Adelaide also available - click on Instant Quote to change your departure city
#       Kids Fly Return from $99 *T&C’s apply"
#           })
# listing2.photo.attach(io: File.open("app/assets/images/holiday2.jpg"), filename: "holiday2.jpg", content_type: 'image/jpg')
#
#
# listing3 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Luxury beachfront in Bali ",
#       check_in: "Thu, 28 Mar 2019",
#       check_out: Faker::Date.forward(40),
#       description: "Double-Six Luxury Hotel Seminyak is luxury beachfront Bali accommodation ideal for couples and honeymooners. With fantastic resort facilities such as a rooftop bar and beachfront lagoon swimming pool, Double-Six Luxury Hotel Seminyak is a intimate haven in trendy Seminyak.
#
#       Breakfast Daily
#       BONUS IDR500.000 F&B Credit for dinner at Plantation Grill
#       BONUS IDR500.000 F&B Credit for dinner at Slippery Stones (transfers excluded)
#       BONUS 1 hour Free Flow on selected alcoholic & non-alcoholic drinks at Sunset Bar (7-8pm)
#       BONUS 1x Cocktail at Sling Bar
#       BONUS 1x 1 hour Yoga Class (7-8am) at Rooftop Sunset Bar
#       BONUS 1x tour to John Hardy Workshop & Showroom in Ubud (including lunch & transfers)
#       BONUS 10% Discount at Chez Gado-Gado Restaurant
#       BONUS 20% discount for all treatments at Acqua Perla Spa during stay
#       In-suite check in/check out with Welcome Cocktails & Cold Towel on arrival
#       Free WiFi
#       24 Hour Butler, housekeeping & room service
#       Personalised wake up call
#       Choice of soft or firm micro fibre pillow
#       Return Private Car Transfers - Denpasar Airport to Double-Six Luxury Hotel Seminyak"
#           })
# listing3.photo.attach(io: File.open("app/assets/images/holiday3.jpg"), filename: "holiday3.jpg", content_type: 'image/jpg')
#
# listing4 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Phuket Graceland Resort & Spa",
#       check_in: "Thu, 28 Mar 2019",
#       check_out: Faker::Date.forward(40),
#       description: "Phuket Graceland Resort & Spa is ideally situated, boasting a beachfront location on the famous Patong Beach. This Phuket accommodation is great for couples and families who want to be close to shopping, markets and main tourist hotspots whilst enjoying a host of onsite resort facilities such as swimming pools, day spa, kids club and restaurants.
#       Breakfast daily
#       Welcome Drink with Thai Herb on arrival
#       Free WiFi
#       Return Private Vehicle Transfers - Phuket Airport to Phuket Graceland Resort & Spa"
#           })
# listing4.photo.attach(io: File.open("app/assets/images/holiday4.jpg"), filename: "holiday4.jpg", content_type: 'image/jpg')
#
# listing5 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Grand Princess Cruise",
#       check_in: "Thu, 28 Mar 2019",
#       check_out: Faker::Date.forward(40),
#       description: "The Grand Princess is designed to be your home away from home, with a range of accommodation options to suit all styles and budgets. From the most affordable Interior cabin to the luxury of the Suite and everything in between, your stay will be anything but ordinary. For larger groups who want a bit more space, there is also a 2 bedroom Family Suite.
#       Kids, teens and families are well taken care of and Princess understand the importance of quality time. Onboard activities spark curiosity and fuel creativity while the shore excursions will engage and inspire the kids.
#
#       The Main Dining room is available for the traditional early and late sitting as well as the option of anytime dining, allowing you to dine where and when you wish and with whom. For something a little more casual head to the Horizon Court serving breakfast, lunch and dinner in a more relaxed and casual atmosphere with an ever changing menu.
#
#       If it’s a pool side snack you are after the Trident Grill offers burgers and hot dogs served with a variety of fixings. Hand tossed pizza hot out of the oven; grab a slice or the whole pizza. Complimentary 24 hour room service is also available if you are looking to be a little indulgent.
#
#       If that’s not enough to whet the appetite you can always opt for one of the specialty restaurants for an additional cover charge. For a taste of Italian enjoy Sabatini’s Italian Trattoria or head to the Crab Shack for outstanding seafood. For a prime cut steak cooked to perfection, head to the Crown Grill while wine lovers are sure to be pleased with the selection at Vines."
#           })
# listing5.photo.attach(io: File.open("app/assets/images/holiday5.jpg"), filename: "holiday5.jpg", content_type: 'image/jpg')
#
# listing6 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Caribbean Cruise",
#       check_in: "Thu, 28 Mar 2019",
#       check_out: Faker::Date.forward(40),
#       description: "Set sail for five days and six nights in the waters of the Caribbean. Staterooms feature all the same amenities as other Interior staterooms, with a different layout — including one Twin bed, and either an upper Pullman or sofa bed. They also feature linens from our Comfort Collection, a full private bathroom and more."
#           })
# listing6.photo.attach(io: File.open("app/assets/images/img5.jpg"), filename: "img5.jpg", content_type: 'image/jpg')
#
# listing7 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Ski in Varmland, Sweden",
#       check_in: "Thu, 28 Mar 2019",
#       check_out: Faker::Date.forward(40),
#       description: "Branas skicenter is situated in the north of Varmland, Sweden. They offer ski possibilities for everyone. They have 27 lifts as well as two Children areas and a snow park. Branas is a family friendly skicenter and has been awarded as the best skicenter for families."
#           })
# listing7.photo.attach(io: File.open("app/assets/images/img13.jpg"), filename: "img13.jpg", content_type: 'image/jpg')
#
# listing8 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Ski in Arrabelle, USA",
#       check_in: "Thu, 28 Mar 2019",
#       check_out: Faker::Date.forward(40),
#       description: "When you arrive at the Arrabelle, you will feel as if you truly belong. Opulent, yet inviting, no other hotel can combine the same level of luxury with the type of old-world charm that inspired so much of the Vail Valley we know today. Savor the lavish accommodations while reconnecting with the true spirit of one of America’s most iconic ski resorts."
#           })
# listing8.photo.attach(io: File.open("app/assets/images/img12.jpg"), filename: "img12.jpg", content_type: 'image/jpg')
#
# listing9 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Apartment in Glendale, Denver",
#       check_in: "Mon, 4 Mar 2019",
#       check_out: "Wed, 6 Mar 2019",
#       description: "If you are looking for a unique apartment home with a relaxed vibe and homey feel in the heart of Glendale- one of Denver’s newest up and coming locations, The Collective Glendale has the perfect apartment home to suit your lifestyle. Our collection of newly renovated, eclectic communities combines updated interiors and exteriors with fabulous amenities like fire pits, enclosed grilling areas, hot tubs, sparkling pools, outdoor lounges and dog parks for a one of a kind Denver living experience. "
#           })
# listing9.photo.attach(io: File.open("app/assets/images/img10.jpg"), filename: "img10.jpg", content_type: 'image/jpg')
#
# listing10 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Tallebudgera Valley on the Gold Coast",
#       check_in: "Mon, 4 Mar 2019",
#       check_out: "Wed, 6 Mar 2019",
#       description: "Set in Tallebudgera Valley on the Gold Coast, this serene spa resort is 10 km from the centre of Tallebudgera, 12 km from Burleigh Heads beach and 20 km from Gold Coast Airport. 
#       The individually decorated rooms, cottages and villas feature diverse styles, including vintage Australian and modern Asian, as well as free Wi-Fi. Amenities vary, but include wood-burning stoves, verandahs and private plunge pools.
#       Amenities include 2 infinity pools, plus a poolside dining room serving spa cuisine made from organic, local ingredients. There's also a sauna, a gym and a spa, as well as tennis courts."
#           })
# listing10.photo.attach(io: File.open("app/assets/images/img3.jpg"), filename: "img3.jpg", content_type: 'image/jpg')
#
# listing11 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Injidup Spa Retreat in the heart of the Margaret River",
#       check_in: "Mon, 4 Mar 2019",
#       check_out: "Wed, 6 Mar 2019",
#       description: "Situated on a secluded beach in the heart of the Margaret River wine region, Injidup Spa Retreat features 10 luxurious adult only villas, each with a private plunge pool and stunning ocean views. The Injidup Spa offers massages and body treatments in a unique setting.
#       All guests receive a gourmet breakfast hamper and a bottle of wine on arrival. Private in-villa dining is available upon prior arrangement. The property also offers free Wi-Fi.
#       All villas feature a kitchenette and a private patio with BBQ. Each has a living room with a fireplace, a flat-screen TV, a DVD player and a bluetooth speaker.
#       Located directly on the renowned Cape to Cape Track, this retreat offers great opportunities for long walks along the coast. Yallingup Injidup Spa Retreat is 5 minutes’ drive from Wardan Aboriginal Cultural Centre and 15 minutes’ from Ngilgi Cave. Busselton Airport is a 40-minute drive away."
#           })
# listing11.photo.attach(io: File.open("app/assets/images/img8.jpg"), filename: "img8.jpg", content_type: 'image/jpg')
#
# listing12 = Listing.create({
#       value: Faker::Number.number(4),
#       price: Faker::Number.number(3),
#       guest: rand(1...6),
#       seller_id: rand(1...10),
#       title: "Agios Ioannis, Mykonos",
#       check_in: "Mon, 4 Mar 2019",
#       check_out: "Wed, 6 Mar 2019",
#       description: "Perfectly located in Agios Ioannis, just 400m from the beach, this luxury villa rental on Mykonos is ideal for summer holidays, for families and friends. There are wonderful sunset views to Delos Island from the terrace.
#       The villa is on two levels, a ground floor and first floor, offering two different entrances. The first floor has a large infinity swimming pool, surrounded by a terrace with sunbeds, well furnished outdoor living areas, including an al fresco dining area with built-in barbecue. Within the private grounds is a picturesque small chapel.
#       The villa accommodates 12 guests in six spacious bedrooms, with bathrooms ensuite, and there is also an extra maid’s room for up to two people. Amenities include full air conditioning, satellite TV and Wi-Fi access."
#           })
# listing12.photo.attach(io: File.open("app/assets/images/img17.jpg"), filename: "img17.jpg", content_type: 'image/jpg')
#



# _________________________________________________________________________________





# 50.times do
# listing = Listing.create({
#     value: Faker::Number.number(4),
#     price: Faker::Number.number(3),
#     guest: rand(1...6),
#     seller_id: rand(1...10),
#     title: Faker::Address.city,
#     check_in: "Thu, 28 Mar 2019",
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
