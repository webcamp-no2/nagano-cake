class Genre < ApplicationRecord
	has_many :product, dependent: :destroy

	# バリデーション
	validates :name, presence: true
	validates :active_status, presence: true

	# 有効無効ステータス
	enum active_status: {"無効": false, "有効": true}
end
