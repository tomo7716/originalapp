class ApplicationController < ActionController::Base
  before_action :basic_auth, unless: -> { Rails.env.test? }
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path   # 管理者画面
    else
      user_path(resource)    # 一般ユーザーのマイページ
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name,
      students_attributes: [:name]
    ])
  end
end
