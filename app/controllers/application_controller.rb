class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :denger

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  # ログインしてるユーザーと投稿してるユーザーが同じかどうか
  # 同じじゃない場合にリダイレクト先を指定する
end
