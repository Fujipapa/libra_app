class MesController < ApplicationController
  before_action :authenticate_user

  def show
    @reservations = Reservation.where("user_id = #{@current_user.id}").includes(book: %i[genre rental])
    @rentals = Rental.where("user_id = #{@current_user.id}").includes(book: :genre)
  end

  def edit; end

  def update
    @user = User.find_by(id: @current_user.id)

    if !@user.authenticate(params[:password])
      @user.email = params[:email] if params[:email].present?
      @user.password_digest = User.digest(params[:new_password]) if params[:new_password].present?

      if @user.valid?
        @user.save
        flash[:notice] = '変更内容を保存しました'
        redirect_to me_path
      else
        @error_message = '入力内容が不適切です'
        @email = params[:email]
        @password = params[:password]
        @new_password = params[:new_password]
        render('mes/edit')
      end
    else
      @error_message = '入力内容が不適切です'
      @email = params[:email]
      @password = params[:password]
      @new_password = params[:new_password]
      render('mes/edit')
    end
  end

  def confirmation; end

  def destroy
    @user = User.find_by(id: @current_user.id)

    if @user.rentals.present?
      flash[:notice] = 'まだ返却されていない本があります。先に本の返却をお願いします。'
      redirect_to me_path
    else
      @user.destroy
      flash[:notice] = 'ユーザー情報を削除しました'
      session[:user_id] = nil
      redirect_to root_path
    end
  end
end
