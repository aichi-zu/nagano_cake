# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
  last_name: "sei",
  first_name: "mei",
  last_name_kana: "sei_kana",
  first_name_kana: "mei_kana",
  post_code: "123-4567",
  address: "totemoyoitokoro",
  phone_number: "1234-56-7890",
  email: "customer@mail.com",
  password: "654321",
  is_active: "true"
)
