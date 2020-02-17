class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	has_many :order_products,dependent: :destroy

  attachment :image

  with_options presence: true do
    validates :image
    validates :name, length: {minimum: 1, maximum:15}
    validates :description
    validates :genre_id
    validates :price, numericality: true
  end
  validates :sales_status, inclusion: {in: [true, false]}

  #単価（税込）
  def price_with_tax
    (price * Constants::TAX).round
  end
end
