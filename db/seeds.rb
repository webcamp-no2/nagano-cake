# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Fakerを日本語化する
Faker::Config.locale = :ja

# admin
3.times do |num|
  Admin.create!(
    email: Faker::Internet.email,
    password: "password"
  )
end
# admin/

# customer
3.times do |num|
  Customer.create!(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    kana_last_name: "ノダ",
    kana_first_name: "ケンセイ",
    password: "password",
    email: Faker::Internet.email,
    address: "長崎県〇〇町1234-56",
    zip_code: Faker::Address.zip_code,
    tel: Faker::PhoneNumber.phone_number,
    admittion_status: Faker::Number.within(range: 0..1)
  )
end
# customer/

# genre
genre_names = [
  'ケーキ',
  'キャンディ',
  'プリン',
  '焼き菓子'
]

genre_names.each do |genre_name|
  Genre.create!(
    name: genre_name,
    active_status: Faker::Boolean.boolean(true_ratio: 0.7)
  )
end
# genre/

# product
3.times do |num|
  Product.create!(
    genre_id: Genre.all.sample.id,
    name: Faker::Dessert.variety,
    image_id: 'default', # not nullのため入れている。画像表示する時falloutの状態にしたいが、エラーになるかも
    description: Faker::Food.description,
    price: Faker::Number.between(from: 100, to: 1000),
    sales_status: Faker::Number.within(range: 0..1)
  )
end
# product/

# customer
Customer.find_each do |customer|
  # order
  3.times do |num|
    Order.create!(
      customer_id: customer.id,
      payment_method: rand(2) == 1 ? "銀行振込" : "クレジットカード",
      status: Faker::Number.within(range: 0..4),
      zip_code: Faker::Address.zip_code,
      delivery_address: Faker::Internet.email,
      delivery_name: Faker::Name.name,
      postage: 800,
      payment: Faker::Number.between(from: 1000, to: 20000)
    )
  end
  # order/

  # delivery
  3.times do |num|
    Delivery.create!(
      customer_id: customer.id,
      zip_code: Faker::Address.zip_code,
      address: "神奈川県川崎市△△区1234-56",
      name: Faker::Name.name
    )
  end
  # delivery/

  # order product
  3.times do |num|
    OrderProduct.create!(
      product_id: Product.all.sample.id,
      order_id: Order.all.sample.id,
      count: Faker::Number.within(range: 1..20),
      ordered_price: Faker::Number.between(from: 100, to: 1000),
      production_status: Faker::Number.within(range: 0..4)
    )
  end
  # order product/

  # cart item
  3.times do |num|
    CartItem.create!(
      customer_id: Customer.all.sample.id,
      product_id: Product.all.sample.id,
      count: Faker::Number.within(range: 1..20)
    )
  end
  # cart item/

end
# customer/