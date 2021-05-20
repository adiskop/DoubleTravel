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
#omniauth login
def fbcreate
    @user = User.find_or_create_by(uid: auth[:uid]) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = auth['uid'] #this is not strong! best to use Secure Random Hex
      end
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:message] = @user.errors.full_messages
        redirect_to '/signup'
      end
end

def home
end

#logout route
def destroy
    session.clear
    redirect_to '/'
end

private
 
  def auth
    request.env['omniauth.auth']
  end

end