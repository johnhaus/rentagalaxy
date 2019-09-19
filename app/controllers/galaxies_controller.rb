class GalaxiesController < ApplicationController

  def index
    @galaxy = Galaxy.all
  end

  def show
    @galaxy = Galaxy.find(params[:id])
  end
end
