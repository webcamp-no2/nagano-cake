class Delivery < ApplicationRecord
	belongs_to :customer

  def full_address
    "〒#{zip_code} #{address} #{name}"
  end
	# バリデーション
	validates :zip_code, presence: true
	validates :address, presence: true
	validates :name, presence: true
end
