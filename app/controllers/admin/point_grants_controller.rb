# app/controllers/admin/point_grants_controller.rb
class Admin::PointGrantsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def new
    # プルダウンに「保護者名 - 生徒名 (残: n)」の形で表示
    @students = Student.includes(:user).references(:user)
                       .order('users.name ASC, students.name ASC')
    @lesson = Lesson.new
  end

  def create
    @student = Student.find(params[:lesson][:student_id])
    ticket_count = params[:lesson][:ticket_count].to_i

    if ticket_count <= 0
      redirect_to new_admin_point_grant_path, alert: "チケット枚数は1以上を入力してください" and return
    end

    # ポイントはチケット枚数 × 100 に自動換算
    points = ticket_count * 100

    lesson_params = params.require(:lesson).permit(:date, :classroom_name, :course, :lesson_type)

    @student.with_lock do
      # ポイント付与
      @student.points = (@student.points || 0) + points
      @student.save!

      # Lesson 作成（ticket_count, points も保存）
      @student.lessons.create!(
        lesson_params.merge(
          ticket_count: ticket_count,
          points: points
        )
      )
    end

    redirect_to admin_dashboard_path,
                notice: "#{@student.user.name} / #{@student.name} に チケット#{ticket_count}枚 (#{points}pt) 付与しました"
  rescue => e
    redirect_to new_admin_point_grant_path, alert: "付与に失敗しました: #{e.message}"
  end

  private

  def require_admin!
    redirect_to root_path, alert: "権限がありません" unless current_user&.admin?
  end
end
