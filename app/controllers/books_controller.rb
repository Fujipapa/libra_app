class BooksController < ApplicationController
    before_action :set_reservations_current_user_has

    def index 
        @keyword = params[:keyword]
        @books = Book.search(@keyword)
        @books = ENV["RACK_ENV"] == "production" ? @books.order_by_char : @books.order('title_kana')
        @books = Kaminari.paginate_array(@books).page(params[:page]).per(10)
    end

    def show 
        @book_id = params[:id]
        @book = Book.includes(:genre).find(@book_id)
        @reservation = Reservation.find_by(book_id: @book_id)
    end

    def set_reservations_current_user_has
        @reservations = Reservation.where("user_id = #{@current_user.id}")
    end
end
