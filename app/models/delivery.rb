class Delivery < ApplicationRecord
	belongs_to :customer

	# バリデーション
	validates :zip_code, presence: true
	validates :address, presence: true
	validates :name, presence: true
end
