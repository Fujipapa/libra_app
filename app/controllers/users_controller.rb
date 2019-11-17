class UsersController < ApplicationController

    def index
    end

    def show 
    end

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(email: params[:email],
                        password: params[:password], 
                        role: 1)
        if @user.save
            flash[:notice] = "ユーザー情報の登録が完了しました"
            session[:user_id] = @user.id
            redirect_to user_url(@user.id)
        else
            render('users/new')
        end
    end

    def edit 
    end

    def update 
    end

    def destroy 
    end
    

    
end
