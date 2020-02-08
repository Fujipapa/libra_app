class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  def set_current_user
      @current_user = User.find_by(id: session[:user_id])
  end

  def forbid_login_user
    if @current_user.present?
      flash[:notice] = "すでにログインしています"
      redirect_to books_path
    end
  end

  def authenticate_user
    if @current_user == nil
        flash[:notice] = "ログインが必要です"
        redirect_to login_path
    end
  end

  def ensure_admin_user
    if @current_user.role != "admin"
      flash[:notice] = "権限がありません"
      redirect_to books_path
    end
  end
end
