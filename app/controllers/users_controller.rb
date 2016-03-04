class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id]) if logged_in?
  end
end
