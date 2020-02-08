class RentalsController < ApplicationController
    before_action :authenticate_user

    def rental_form
    end

    def create
        @user = User.find(@current_user.id)
        @book = Book.find_by(id: params[:book_id])

        if !@book.present?
            flash[:notice] = "コードを読み取った後に「借りる」を押してください"
            render("rentals/rental_form") and return
        elsif Reservation.of_other(@user, @book).present?
            flash[:notice] = "この本は現在予約されています"
            render("rentals/rental_form") and return
        elsif Rental.create(user: @user, book: @book)
            @reservation = @user.reservations.find_by(book: @book)
            @reservation.destroy if @reservation.present?

            add_rented_date_and_return_date(@book)
            flash[:notice] = "貸出処理が完了しました"
            redirect_to me_path
        else
            flash[:notice] = "この本は現在貸出できません"
            render("rentals/rental_form") and return
        end     
    end

    private

        #貸出日と返却日(貸出日から1週間)を渡されたインスタンスに記録する。
        def add_rented_date_and_return_date(book)
            book.rented_date = DateTime.now
            book.return_date = DateTime.now.since(1.week)
            book.save
        end
end
