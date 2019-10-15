class GalaxiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  skip_after_action :verify_authorized, only: [:show]
  # skip_after_action :verify_policy_scoped, only: [:index]

  def index
    @galaxies = policy_scope(Galaxy)
  end

  def show
    @galaxy = policy_scope(Galaxy).find(params[:id])
  end
end
