class ReservationsController < ApplicationController
    before_action :authenticate_user

    def create
        @reservation = Reservation.new(user_id: @current_user.id, book_id: params[:book_id])
        if @reservation.save
            flash[:notice] = "予約が完了しました"
            redirect_to books_path
        else 
            flash[:notice] = "予約ができませんでした。予約状況の確認をお願いします"
            redirect_to books_path
        end
    end
end
