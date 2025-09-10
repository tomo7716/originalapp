class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "ユーザー登録が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    @students = @user.students || []
  end

   private

  def ensure_correct_user
    # 他人のページにアクセスした場合はリダイレクト
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
