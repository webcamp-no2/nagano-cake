class Admin::HomesController < Admin::BaseController
  def top
    # 今日のオーダーを取得
    @order = Order.where("created_at >= :start_date", start_date: Date.today)
    
  end
end
