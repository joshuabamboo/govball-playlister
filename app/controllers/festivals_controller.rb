class FestivalsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @fests = Festival.all
  end

  def show
    @fest = Festival.find(params[:id])
  end
end
