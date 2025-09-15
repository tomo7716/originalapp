class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show]

  def show
    @user = current_user
    @students = @user.students || []
  end

  private

  def ensure_correct_user
    # 自分以外の /users/:id にアクセスされたら強制的に自分のページへ
    if params[:id].to_i != current_user.id
      redirect_to user_path(current_user), alert: "権限がありません"
    end
  end

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation,
      students_attributes: [:id, :name, :_destroy]
    )
  end
end
