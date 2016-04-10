class VagonsController < ApplicationController
  before_action :set_train
  # def index
  # 	@vagons = Vagon.all
  # end

  # def show
  # 	@vagon = Vagon.find(params[:id])
  # end

  def new
  	@vagon = Vagon.new
  end

  def create
  	@vagon = @train.vagons.new(vagon_params)
  	if @vagon.save
  	  redirect_to @train
  	else
  	  render :new
  	end
  end

  # def edit
  # 	@vagon = Vagon.find(params[:id])
  # end

  # def update
  # 	@vagon = Vagon.find(params[:id])
  # 	if @vagon.update(vagon_params)
  # 	  redirect_to @vagon
  # 	else
  # 		render :edit
  # 	end
  # end

  # def destroy
  # 	@vagon = Vagon.find(params[:id])
  # 	@vagon.destroy
  # 	redirect_to vagons_path
  # end
  
private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def vagon_params
     if params.has_key?(:economy_carriage)
        params[:vagon] = params.delete(:economy_carriage)
      elsif params.has_key?(:luxury_carriage)
        params[:vagon] = params.delete(:luxury_carriage)
      elsif params.has_key?(:coupe_carriage)
        params[:vagon] = params.delete(:coupe_carriage)
      elsif params.has_key?(:sedentary_carriage)
        params[:vagon] = params.delete(:sedentary_carriage)
      end
  	params.require(:vagon).permit(:train_id, :number, :type, :train_id, :up_seat, :down_seat, :side_up_seat, :side_down_seat, :seat_place)
  end
end 