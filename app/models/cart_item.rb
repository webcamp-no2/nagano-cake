class CartItem < ApplicationRecord
	belongs_to :product
	belongs_to :customer

	# 小計
	def subtotal_price
		(count * product.price * Constants::TAX).round
	end
end
