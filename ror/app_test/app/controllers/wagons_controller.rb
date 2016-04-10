class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]
  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new 
  	@wagon = Wagon.new
  end

  def create
    @wagon = @train.wagons.new(wagon_params)
    # @wagon = Wagon.new(wagon_params)
    if @wagon.save
      redirect_to @train
    else
      render :new
    end
  end

  def edit
  end

  def update
  	if @wagon.update(wagon_params)
  	  redirect_to @wagon
  	else
  	  render :edit
  	end
  end

  def destroy
  	@wagon.destroy
  	redirect_to wagons_path
  end

private 
  
  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    if params.has_key?(:economy_carriage)
      params[:wagon] = params.delete(:economy_carriage)
    elsif params.has_key?(:sw_carriage)
      params[:wagon] = params.delete(:sw_carriage)
    elsif params.has_key?(:coupe_carriage)
      params[:wagon] = params.delete(:coupe_carriage)
    elsif params.has_key?(:sedentary_carriage)
      params[:wagon] = params.delete(:sedentary_carriage)
    end
    params.require(:wagon).permit(:number, :train_id, :type, :up_seats, :down_seats, :side_top_seats, :side_bottom_seats, :seat_place)
  end
end