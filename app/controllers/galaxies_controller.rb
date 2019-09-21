class GalaxiesController < ApplicationController

  def index
    @galaxies = Galaxy.all
  end

  def show
    @galaxy = Galaxy.find(params[:id])
  end
end
