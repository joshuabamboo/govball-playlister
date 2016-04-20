class FestivalsController < ApplicationController
  def index
    @fests = Festival.all
  end

  def show
    @fest = Festival.find(params[:id])
  end
end
