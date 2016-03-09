class UsersController < ApplicationController
  before_action :set_user
  def index
    @festivals = Festival.all
  end

  def ajazz
    @fest = Festival.find params[:festivals]
  end

  private
  def set_user
    @user = User.find(session[:user_id]) if logged_in?
  end
end
