# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ann = User.create(name: "Ann", email: "ann@ironflat.com", age: 23)
biz = User.create(name: "Biz", email: "biz@ironflat.com", age: 24)
dan = User.create(name: "Dan", email: "dan@ironflat.com", age: 25)
ian = User.create(name: "Ian", email: "ian@ironflat.com", age: 26)
jon = User.create(name: "Jon", email: "jon@ironflat.com", age: 27)
kip = User.create(name: "Kip", email: "kip@ironflat.com", age: 28)
len = User.create(name: "Len", email: "len@ironflat.com", age: 29)

yoga = Listing.create(value: 1000, price: 800, guests: 3, user_id: 1, description: "Yoga Retreat", start_date: "12/28/2018", end_date: "01/02/2019")
hotel = Listing.create(value: 2000, price: 1700, guests: 4, user_id: 2, description: "NY Hotel", start_date: "12/27/2018", end_date: "01/02/2019")
airbnb = Listing.create(value: 3000, price: 2600, guests: 5, user_id: 3, description: "Miami Airbnb", start_date: "12/26/2018", end_date: "01/04/2019")
ski = Listing.create(value: 4000, price: 3450, guests: 5, user_id: 1, description: "Tahoe Ski", start_date: "12/23/2019", end_date: "01/03/2020")
airbnb2 = Listing.create(value: 5000, price: 4350, guests: 6, user_id: 2, description: "Austin Airbnb", start_date: "12/20/2019", end_date: "01/02/2020")
cruise = Listing.create(value: 6000, price: 5100, guests: 8, user_id: 3, description: "Mediterranean Cruise", start_date: "12/19/2019", end_date: "01/02/2020")

sale_001 = Sale.create(seller_id: 1, buyer_id: 4, listing_id: 1)
sale_002 = Sale.create(seller_id: 2, buyer_id: 5, listing_id: 2)
sale_003 = Sale.create(seller_id: 3, buyer_id: 6, listing_id: 3)
