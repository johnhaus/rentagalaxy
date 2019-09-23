class RentsController < ApplicationController

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


  private

  def rent_params
    params.require(:rent).permit(:start_date, :end_date)
  end

end
