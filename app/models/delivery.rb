class Delivery < ApplicationRecord
	belongs_to :customer

  def full_address
    "〒#{zip_code} #{address} #{name}"
  end
	# バリデーション
	VALID_ZIP_CODE = /\A\d{3}[-]\d{4}\z/  # 郵便番号（ハイフンあり7桁）
	validates :zip_code, presence: true, format: {
																					with: VALID_ZIP_CODE,
																					message: "はハイフンあり7桁で入力してください。"
																				}
	validates :address, presence: true
	validates :name, presence: true
end
