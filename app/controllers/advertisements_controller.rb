class AdvertisementsController < ApplicationController
  def index
  	@advertisements = Advertisement.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create

  	Advertisement.create(params[:advertisement].permit!)

  	redirect_to "/advertisements"
  end
end
