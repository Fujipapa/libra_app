class LoginController < ApplicationController

  def login_form
    
  end


  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:notice] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @password = params[:password]
      @email = params[:email]
      render('login/login_form')
    end    
  end

end
