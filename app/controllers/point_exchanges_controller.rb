class PointExchangesController < ApplicationController
  before_action :authenticate_user!

  def new
    @items = Item.all
  end

  def index
    @point_exchanges = PointExchange.where(student_id: current_user.students.ids)
    @available_points = current_user.total_points
  end

  def create
    quantities = params[:quantities] || {}
    student = current_user.students.order(:id).first  # 長男固定

    total_used_points = 0
    created_exchanges = []

    # ポイント計算と交換申請作成
    quantities.each do |item_id, qty|
      qty = qty.to_i
      next if qty <= 0

      item = Item.find(item_id)
      used_points = item.points * qty
      total_used_points += used_points

      created_exchanges << student.point_exchanges.create!(
        description: "#{item.name} × #{qty}",
        points: used_points,
        status: "pending"
      )
    end

    if created_exchanges.any?
      if student.points >= total_used_points
        # 長男のポイントを減らす
        student.update!(points: student.points - total_used_points)
        redirect_to history_student_path(student), notice: "商品交換を申請しました"
      else
        # ポイント不足の場合は作成した申請を削除
        created_exchanges.each(&:destroy)
        redirect_to new_point_exchange_path, alert: "ポイントが不足しています"
      end
    else
      redirect_to new_point_exchange_path, alert: "商品を選択してください"
    end
  end
end
