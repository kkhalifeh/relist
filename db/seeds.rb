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
#   age = rand(21...60)
#   User.create({name: "#{name}", email: "#{email}", age: age}) end
# categories = Category.create([{ label: 'City Hotel'},{ label: 'City and shop'},{ label: 'Cruise'},{ label: 'AirBNB'}, { label: 'Spa & Retreats'}, { label: 'Honeymoon'}])

# holidays = 60.times do
#   value = Faker::Number.number(4)
#   price = Faker::Number.number(3)
#   guest = rand(1...6)
#   user_id = rand(1...31)
#   title = Faker::Address.city
#   check_in = Faker::Date.forward(20)
#   check_out = Faker::Date.forward(30)
#   description = Faker::Marketing.buzzwords
#   category_id = rand(1...6)
#   Holiday.create({value: value, price: price, guest: guest, user_id: user_id, title: "#{title}", check_in: check_in, check_out: check_out, description: "#{description}", category_id: category_id}) end

# create_table "holidays", force: :cascade do |t|
#   t.integer "value"
#   t.integer "price"
#   t.integer "guest"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "user_id"
#   t.string "title"
#   t.date "check_in"
#   t.date "check_out"
#   t.string "description"
#   t.index ["user_id"], name: "index_holidays_on_user_id"
# end
#
# create_table "listings", force: :cascade do |t|
#   t.integer "seller_id"
#   t.integer "buyer_id"
#   t.integer "holiday_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["holiday_id"], name: "index_listings_on_holiday_id"
# end
#
# create_table "users", force: :cascade do |t|
#   t.string "name"
#   t.string "email"
#   t.integer "age"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
