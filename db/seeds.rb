# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# （参考）seedを実行する前に現在の全てのテーブルのデータを削除するコマンド
# rails db:migrate:reset

# Fakerを日本語化する
Faker::Config.locale = :ja

profiles = [
  { email: "oka@example.com", name: "おかちゃん" },
  { email: "ono@example.com", name: "おのしゅん" },
  { email: "noda@example.com", name: "のだっち" },
]

profiles.each do |profile|
  Admin.create!(
    email: profile[:email],
    name: profile[:name],
    password: "password"
  )
end
# admin/

# customer
profiles.each do |profile|
  Customer.create!(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    kana_last_name: "ノダ",
    kana_first_name: "ケンセイ",
    password: "password",
    email: profile[:email],
    address: "長崎県〇〇町1234-56",
    zip_code: Faker::Address.zip_code,
    tel: Faker::PhoneNumber.phone_number,
    admittion_status: rand(2) == 1 ? "withdraw" : "validity",
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
    active_status: rand(2) == 1 ? "無効" : "有効",
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
    sales_status: Faker::Boolean.boolean(true_ratio: 0.7)
  )
end
# product/

# customer
Customer.find_each do |customer|
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

  # order
  Faker::Number.within(range: 5..10).times do |num|
    Order.create!(
      customer_id: customer.id,
      payment_method: rand(2) == 1 ? "銀行振込" : "クレジットカード",
      status: Faker::Number.within(range: 0..4),
      zip_code: Faker::Address.zip_code,
      delivery_address: Delivery.where(customer_id: customer.id).sample.address,
      delivery_name: Delivery.where(customer_id: customer.id).sample.name,
      postage: 800,
      payment: Faker::Number.between(from: 1000, to: 10000)
    )
  end
  # orderの作成日を10日前～今日までの期間でばらけさせる
  Order.all.each do |order|
    order.update(created_at: (rand*10).days.ago)
  end
  # order/

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

# order product
products = Product.all.order("RANDOM()")
Order.all.each do |order|
  1..Product.count.times do |num|
    OrderProduct.create!(
      product_id: products[num-1].id, # ランダムに取得した商品を順番に対応付ける
      order_id: order.id,
      count: Faker::Number.within(range: 1..5),
      ordered_price: 0,
      production_status: Faker::Number.within(range: 0..3)
    )
  end
end
# order product/

# order_productの支払い金額（ordered_priceを計算する）
OrderProduct.all.each do |order_product|
  order_product.update(ordered_price: order_product.product.price*order_product.count)
end
# orderの請求金額（payment）を計算する
Order.all.each do |order|
  order.update(payment: order.order_products.inject(0){|result, order_product| result + order_product.ordered_price })
end