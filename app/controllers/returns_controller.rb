class ReturnsController < ApplicationController
  def return_form
    @book = Book.find_by(id: params[:id])
    if !@book.rental
      flash[:notice] = '処理に失敗しました'
      redirect_to me_path
    else
      if @book.rental.user_id != @current_user.id
        flash[:notice] = '権限がありません'
        redirect_to books_path
      end
    end
  end

  def destroy
    if params[:return_code] != 'returned_it'
      flash[:notice] = '処理に失敗しました'
      redirect_to me_path
    else
      @rental = Rental.find_by(id: params[:id])
      @book = @rental.book
      if @rental.destroy
        @book.status = true
        @book.rented_date = @book.return_date = nil
        @book.save
        flash[:notice] = '返却処理が完了しました'
        redirect_to me_path
      end
    end
  end
end
