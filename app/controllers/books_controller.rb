class BooksController < ApplicationController
    def index 
        @keyword = params[:keyword]
        @books = Book.search(@keyword)
        @books = ENV["RACK_ENV"] == "production" ? @books.order_by_char : @books.order('title_kana')
        @books = Kaminari.paginate_array(@books).page(params[:page]).per(10)
    end
end
