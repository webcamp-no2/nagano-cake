class Order < ApplicationRecord
	has_many :order_products, dependent: :destroy
	belongs_to :customer
	def total_count
		total = 0
		order_products.each do |order_product|
			total += order_product.count
		end
		total
	end
end
