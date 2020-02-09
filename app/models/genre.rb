class Genre < ApplicationRecord
	has_many :product, dependent: :destroy

	# 有効無効ステータス
	enum active_status: {"無効" =>false, "有効" =>true}
end
