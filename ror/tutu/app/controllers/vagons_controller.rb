class VagonsController < ApplicationController
  
  def index
  	@vagons = Vagon.all
  end

  def show
  	@vagon = Vagon.find(params[:id])
  end

  def new
  	@vagon = Vagon.new
  end

  def create
  	@vagon = Vagon.new(vagon_params)
  	if @vagon.save
  	  redirect_to @vagon
  	else
  	  render :new
  	end
  end

  def edit
  	@vagon = Vagon.find(params[:id])
  end

  def update
  	@vagon = Vagon.find(params[:id])
  	if @vagon.update(vagon_params)
  	  redirect_to @vagon
  	else
  		render :edit
  	end
  end

  def destroy
  	@vagon = Vagon.find(params[:id])
  	@vagon.destroy
  	redirect_to vagons_path
  end
  
private

  def vagon_params
  	params.require(:vagon).permit(:number, :type, :train_id, :up_seat, :down_seat, :side_up_seat, :side_down_seat, :seat_place)
  end
end 