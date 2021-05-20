class ApplicationController < ActionController::Base

    #give access to these methods in the views
helper_method :current_user, :logged_in?

private

def current_user
    #if current user is already defined it will equal @current_user, 
    #otherwise it will find by id.
    #if there is even a user id in the session (we dont want it to run otherwise)
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
end

def logged_in?
    #seeing if there is a user id
    !!session[:user_id]
end

def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
end


end
