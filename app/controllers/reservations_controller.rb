class ReservationsController < ApplicationController
  before_action :authenticate_user

  def create
    @book = Book.find_by(id: params[:book_id])
    @reservation = Reservation.new(user: @current_user, book: @book)
    if Rental.find_by(user: @current_user, book: @book).present?
      flash[:notice] = '利用中の本です。予約できません'
      redirect_to book_path
    elsif @reservation.save
      flash[:notice] = '予約が完了しました'
      redirect_to books_path
    else
      flash[:notice] = '予約ができませんでした。予約状況の確認をお願いします'
      redirect_to books_path
    end
  end
end
