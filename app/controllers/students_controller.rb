class StudentsController < ApplicationController
  before_action :authenticate_user!

  # ポイント履歴ページ
  def history
    # 自分の子供しか見れないようにする
    @student = current_user.students.find(params[:id])

    # ポイント付与履歴（Lesson）
    @lessons = @student.lessons.order(date: :desc)

    # ポイント使用履歴（PointExchange）※まだ作ってなければ空配列でもOK
    if defined?(PointExchange)
      @point_exchanges = @student.point_exchanges.order(created_at: :desc)
    else
      @point_exchanges = []
    end
  end
end
