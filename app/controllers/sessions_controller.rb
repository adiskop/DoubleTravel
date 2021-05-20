class SessionsController < ApplicationController
#this controller handels loging in and out only. we don't need a model for session

def new
    @user = User.new
    #this would have been not needed if our view was sessions/new instead of sessions/login
    #because rails convention is the first option
    render :login
end

def create
    @user = User.find_by(email: params[:user][:email])
    #if it finds this user and authenticate its password then :
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to destinations_path
    else
        flash[:message] = "Invalid login info, please try again"
        redirect_to '/login'
    end

end

def home
end

#logout route
def destroy
    session.clear
    redirect_to '/'
end



end