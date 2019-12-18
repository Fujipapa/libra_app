class RentalsController < ApplicationController
    before_action :authenticate_user

    def rental_form
    end

    def create
        @user = User.find(@current_user.id)
        @book = Book.find_by(id: params[:book_id])
        if !@book
            flash[:notice] = "コードを読み取ってから「借りる」を押してください"
            render("rentals/rental_form") 
            return
        elsif !@book.status
            flash[:notice] = "この本は既に貸出しています"
            render("rentals/rental_form") 
            return
        else
            @reservation = @current_user.reservations.find_by(book_id: params[:book_id])
            @reservations = Reservation.all 
            @rental = Rental.new(user_id: @user.id, book_id: params[:book_id]) 

            if @reservations.where.not(user_id: @user.id).find_by(book_id: params[:book_id])
                flash[:notice] = "この本は既に予約されているため，貸出できません"
                render("rentals/rental_form")
                return
            else
                if @rental.save 
                    @current_user.rentals.find_by(book_id: params[:book_id]).destroy if @reservaion
                    @book.status = false
                    @book.rented_date = DateTime.now
                    @book.return_date = DateTime.now.since(1.week)
                    @reservation.destroy if @reservation
                    @book.save
                    flash[:notice] = "貸出処理が完了しました"
                    redirect_to me_path
                else 
                    flash[:notice] = "処理に失敗しました"
                    render("rentals/rental_form")
                    return
                end
            end
        end     
    end
end
