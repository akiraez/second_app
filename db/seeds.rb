# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EndUser.create!(
  email: "cc@cc",
  password: "112233",
  first_name: "ああ",
  under_name: "ああ",
  kana_first_name: "アア",
  kana_under_name: "イイ",
  post_number: "1234",
  address: "埼玉",
)

Admin.create!(
    email: "bb@bb",
    password: "1008ta"
)

Genre.create!(
  [
    {
    name: "ケーキ"
  },
  {
    name: "キャンディ"
  }
]
)

Item.create!(
   [
     {
       genre_id: 1,
       image: open("./app/assets/images/cake.jpg"),
       name: "いちご",
       description: "あいうえお",
       price_excluding_tax: 1000,
       is_active_sale_status: true
     },
     {
     genre_id: 2,
     image: open("./app/assets/images/candy.jpg"),
     name: "チョコ",
     description: "かきくけこ",
     price_excluding_tax: 1000,
     is_active_sale_status: true
   }
 ]
)
