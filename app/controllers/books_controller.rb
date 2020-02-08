	class BooksController < ApplicationController
		before_action :authenticate_user

		def index 
			@keyword = params[:keyword]
			@books = Book.search(@keyword)
			@books = ENV["RACK_ENV"] == "production" ? @books.order_by_char : @books.order('title_kana')
			@books = Kaminari.paginate_array(@books).page(params[:page]).per(10)
		end

		def show 
			@book_id = params[:id]
			@book = Book.includes(:genre, :reservation).find(@book_id)

			@can_rental = can_rental_book(@current_user, @book)
			@can_reserve = can_reserve_book(@current_user, @book)
			@rental_propriety =  @can_rental ? "可" : "不可"
		end

		private

		  #すでに本が貸出中の場合か，利用ユーザ以外がその本を予約していた場合にfalseを返す。それ以外はtrue
			def can_rental_book(user, book)
				return false if Rental.find_by(book_id: book.id).present?
				return false if Reservation.of_other(user, book).present?
		
				return true
			end
		
			#既に本が予約済みか，利用ユーザ自身が借りている本の場合にfalseを返す。それ以外はtrue
			def can_reserve_book(user, book)
				return false if Reservation.find_by(book_id: book.id).present?
				return false if Rental.find_by(user_id: user.id, book_id: book.id).present?
		
				return true
			end
	end
