class UsersController < ApplicationController
  before_action :set_user
  def index
  end

  private
  def set_user
    @user = User.find(session[:user_id]) if logged_in?
  end
end
