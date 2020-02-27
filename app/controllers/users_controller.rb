class UsersController < ApplicationController
  before_action :forbid_login_user, { only: %i[new create] }
  before_action :autenticate_user, { only: %i[index show edit update destroy] }
  before_action :ensure_admin_user, { only: %i[index show edit update destroy] }

  def index; end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:email],
                     password: params[:password])
    if @user.save
      flash[:notice] = 'ユーザー情報の登録が完了しました'
      session[:user_id] = @user.id
      redirect_to me_url
    else
      render('users/new')
    end
  end

  def edit; end

  def update; end

  def destroy; end
end
