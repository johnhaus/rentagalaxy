class GalaxiesController < ApplicationController

  def index
    @galaxy = Galaxy.all
  end

end
