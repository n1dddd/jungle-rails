class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.http_basic_authenticate_with(params[:email], params[:password])
        if @user
            session[:user_id] = user.id
            redirect_to '/'
        else
            redirect_to 'login'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end
    
end
