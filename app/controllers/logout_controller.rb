class LogoutController < ApplicationController
    def destroy 
        flash[:notice] = "ログアウトしました"
        session[:user_id] = nil 
        redirect_to login_url
    end   
end
