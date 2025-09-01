module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin_user

    def index
      @users = User.includes(:students).all
    end

    private

    def ensure_admin_user
      redirect_to root_path, alert: "権限がありません" unless current_user.admin?
    end
  end
end