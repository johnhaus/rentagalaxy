class GalaxiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @galaxies = Galaxy.all
  end

  def show
    @galaxy = Galaxy.find(params[:id])
  end
end
