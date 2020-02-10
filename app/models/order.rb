class Order < ApplicationRecord
	has_many :order_products, dependent: :destroy
	belongs_to :customer

	# 注文ステータス
	enum status: {"入金待ち" =>0, "入金確認" =>1, "製作中" =>2, "発送準備中" =>3, "発送済み" =>4}

	# 個数小計
	def total_count
		total = 0
		order_products.each do |order_product|
			total += order_product.count
		end
		total
	end

	# 商品合計
	def product_sum
		total = 0
		order_products.each do |order_product|
			total += order_product.subtotal_price
		end
		total
	end

	# 請求金額合計(送料込み)
	def total_price
		total = 0
		order_products.each do |order_product|
			total += order_product.subtotal_price
		end
		total + postage
	end
end
