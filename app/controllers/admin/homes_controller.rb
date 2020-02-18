class Admin::HomesController < Admin::BaseController
  def top
    # 今日のオーダーを取得
    @orders = Order.where("created_at >= ?", Date.today)
  end
end
