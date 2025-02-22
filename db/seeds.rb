# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ログイン機能用デバッグ値
Admin.create!(
  email: "admin@mail.com",
  password: "123456"
)

Customer.create!(
  last_name: "sei",
  first_name: "mei",
  last_name_kana: "sei_kana",
  first_name_kana: "mei_kana",
  post_code: "1234567",
  address: "my address",
  phone_number: "1234567890",
  email: "customer@mail.com",
  password: "123456",
  is_active: true
)

Genre.create!(
  name: "ケーキ"
)
Genre.create!(
  name: "プリン"
)
Genre.create!(
  name: "焼き菓子"
)
Genre.create!(
  name: "キャンディ"
)

Item.create!(
  genre_id: 1,
  name: "イチゴのケーキ",
  introduction: "イチゴがのったケーキ",
  price_excluding_tax: 100,
  is_sale: true,
)
Item.create!(
  genre_id: 2,
  name: "チョコのプリン",
  introduction: "チョコでできたプリン",
  price_excluding_tax: 200,
  is_sale: true,
)
Item.create!(
  genre_id: 3,
  name: "マドレーヌ",
  introduction: "口溶けのよいマドレーヌ",
  price_excluding_tax: 300,
  is_sale: true,
)
Item.create!(
  genre_id: 4,
  name: "ミルクのキャンディ",
  introduction: "濃厚なミルクのキャンディ",
  price_excluding_tax: 400,
  is_sale: true,
)
