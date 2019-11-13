class LoginController < ApplicationController

  def login_form
    
  end


  def create
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      redirect_to user_url(@user.id)
    else
      @password = params[:password]
      @email = params[:email]
      render('login/login_form')
    end    
  end

end
