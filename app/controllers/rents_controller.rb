class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update]

  def index
    @rents = Rent.all
  end

  def show
    @rent = Rent.find(params[:id])
  end

  def new
    @galaxy = Galaxy.find_by(id: params[:galaxy_id])
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @galaxy = Galaxy.find(params[:galaxy_id])
    @rent.user = current_user
    @rent.galaxy = @galaxy

    if @rent.save
      redirect_to @rent
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rent.update(rent_params)
      redirect_to @rent, notice: 'Rental was successfully updated.'
    else
      render :edit
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:start_date, :end_date)
  end

  def set_rent
    @rent = Rent.find(params[:id])
  end
end
