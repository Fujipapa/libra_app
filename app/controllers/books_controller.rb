class BooksController < ApplicationController
    before_action :authenticate_user
    
    def index 
        @keyword = params[:keyword]
        @books = Book.search(@keyword)
        @books = ENV["RACK_ENV"] == "production" ? @books.order_by_char : @books.order('title_kana')
        @books.each do |book|
            if book.status
                if book.reservation.present?
                    book.status = false if book.reservation.user_id != @current_user.id
                end
            end
        end
        @books = Kaminari.paginate_array(@books).page(params[:page]).per(10)
    end

    def show 
        @book_id = params[:id]
        @book = Book.includes(:genre, :reservation).find(@book_id)
        if @book.status
            if @book.reservation.present?
                @book.status = false if @book.reservation.user_id != @current_user.id
            end
        end
    end
end
