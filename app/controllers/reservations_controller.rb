class ReservationsController < ApplicationController
    def create
        @reservation = Reservation.new(user_id: @current_user.id, book_id: params[:book_id])
        if @reservation.save
            @book = Book.find(params[:book_id])
            @book.status = false
            @book.save
            flash[:notice] = "予約が完了しました"
            redirect_to books_path
        else
            
            flash[:notice] = "予約ができませんでした。予約状況の確認をお願いします"
            redirect_to books_path
        end
    end
end
