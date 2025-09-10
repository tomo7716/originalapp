module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin!
    
    def index
      @users = User.includes(:students).all

      # --- 検索 ---
      if params[:q].present?
        keyword = "%#{params[:q]}%"
        @users = @users.where("users.name LIKE ?", keyword)
                       .or(@users.where("students.name LIKE ?", keyword))
                       .left_joins(:students)
                       .distinct
      end

      # --- ソート ---
      case params[:sort]
      when "user_name"
        @users = @users.order(:name)
      when "student_name"
        @users = @users.left_joins(:students).order("students.name ASC")
      when "points"
        @users = @users.left_joins(:students).order("students.points ASC")
      end
    end

    def show
      @user = User.find(params[:id])
      @students = @user.students.includes(:lessons)

      # ポイント付与履歴（Lesson）
      @lessons = Lesson.joins(:student).where(students: { user_id: @user.id }).order(date: :desc)

      # ポイント使用履歴（PointExchange）
      # @point_exchanges = PointExchange.where(user: @user).order(created_at: :desc)
    end

    private

    def require_admin!
      redirect_to root_path, alert: "権限がありません" unless current_user&.admin?
    end

  end
end