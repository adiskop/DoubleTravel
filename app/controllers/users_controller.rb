class UsersController < ApplicationController

    #loading the signup form
    def new
        @user = User.new
    end
    
    #signup
    def create 
        @user = User.new(user_params)
        if @user.save
            # log user in 
            session[:user_id] = @user.id
            # redirect user to his show page
            redirect_to destinations_path
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

#in order to tell our params that some things are premitted, but some aren't:

private

def user_params
    params.require(:user).permit(:name, :email, :password)
end

end
