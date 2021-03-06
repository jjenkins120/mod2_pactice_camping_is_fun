class CampersController < ApplicationController
  before_action :find_camper, only: [:show]
  
  def index
    @campers = Camper.all
  end

  def show

  end

  def new
    @camper = Camper.new
  end

  def create
    @camper = Camper.create(camper_params)

    if @camper.valid?
      flash[:success] = "You've added a new camper!"
      redirect_to camper_path(@camper)
    else
      flash[:my_errors] = @camper.errors.full_messages
      redirect_to new_camper_path
    end

    
  end

  private

  def find_camper
    @camper = Camper.find(params[:id])
  end

  def camper_params
      params.require(:camper).permit(:name, :age)
  end
end
