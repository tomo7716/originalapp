module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin_user

    def index
      @users = User.includes(:students).all
    end

    private

    def ensure_admin_user
      unless current_user&.admin?
        redirect_to user_path(current_user), alert: "権限がありません"
      end
    end
  end
end