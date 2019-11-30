class BooksController < ApplicationController
    def index 
        @keyword = params[:keyword]
        @books = Book.search(@keyword)
        @books = @books.page(params[:page])
    end
end
