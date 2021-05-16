class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            # log user in 
            session[:user_id] = @user.id
            # redirect user to his show page
            redirect_to @user
        else
            render :new
        end
    end

    def show
    end

#in order to tell our params that some things are premitted, but some aren't:

private

def user_params
    params.require(:user).permit(:name, :email, :password)
end

end
