class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	has_many :ordered_products,dependent: :destroy

  attachment :image

  with_options presence: true do
    validates :image, presence: true
    validates :name, presence: true, length: {minimum: 1, maximum:15}
    validates :description, presence: true
    validates :genre_id, presence: true
    validates :price, presence: true
  end

  validates :sales_status, inclusion: {in: [true, false]}
end
