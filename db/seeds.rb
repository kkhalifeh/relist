# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ann = User.create(name: "Ann", username: "ann", email: "ann@ironflat.com", age: 23, encrypted_password: 1234)
biz = User.create(name: "Biz", username: "biz", email: "biz@ironflat.com", age: 24, encrypted_password: 1234)
dan = User.create(name: "Dan", username: "dan", email: "dan@ironflat.com", age: 25, encrypted_password: 1234)
ian = User.create(name: "Ian", username: "ian", email: "ian@ironflat.com", age: 26, encrypted_password: 1234)
jon = User.create(name: "Jon", username: "jon", email: "jon@ironflat.com", age: 27, encrypted_password: 1234)
kip = User.create(name: "Kip", username: "kip", email: "kip@ironflat.com", age: 28, encrypted_password: 1234)
len = User.create(name: "Len", username: "len", email: "len@ironflat.com", age: 29, encrypted_password: 1234)

yoga = Listing.create(value: 1000, price: 800, guests: 3, user_id: 1, title: "Yoga", description: "Yoga Retreat", check_in: "12/28/2018", check_out: "01/02/2019", category_id: 1)
hotel = Listing.create(value: 2000, price: 1700, guests: 4, user_id: 2, title: "Hotel", description: "NY Hotel", check_in: "12/27/2018", check_out: "01/02/2019", category_id: 2)
airbnb = Listing.create(value: 3000, price: 2600, guests: 5, user_id: 3, title: "Airbnb", description: "Miami Airbnb", check_in: "12/26/2018", check_out: "01/04/2019", category_id: 3)
ski = Listing.create(value: 4000, price: 3450, guests: 5, user_id: 1, title: "Ski", description: "Tahoe Ski", check_in: "12/23/2019", check_out: "01/03/2020", category_id: 5)
airbnb2 = Listing.create(value: 5000, price: 4350, guests: 6, user_id: 2, title: "Airbnb", description: "Austin Airbnb", check_in: "12/20/2019", check_out: "01/02/2020", category_id: 4)
cruise = Listing.create(value: 6000, price: 5100, guests: 8, user_id: 3, title: "Cruise", description: "Mediterranean Cruise", check_in: "12/19/2019", check_out: "01/02/2020", category_id: 6)

sale_001 = Sale.create(seller_id: 1, buyer_id: 4, listing_id: 1)
sale_002 = Sale.create(seller_id: 2, buyer_id: 5, listing_id: 2)
sale_003 = Sale.create(seller_id: 3, buyer_id: 6, listing_id: 3)

yoga_reatreat = Category.create(label: "Yoga Retreat")
hotel = Category.create(label: "Hotel")
airbnb_apartment = Category.create(label: "Airbnb Apartment")
airbnb_house = Category.create(label: "Airbnb House")
snow = Category.create(label: "Ski Trip")
cruise = Category.create(label: "Cruise")
