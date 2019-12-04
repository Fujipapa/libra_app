class LoginController < ApplicationController

  def login_form
  end


  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:notice] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to books_path
    else
      @error_message = "ユーザー名かパスワードが間違っています"
      @password = params[:password]
      @email = params[:email]
      render('login/login_form')
    end    
  end

end
