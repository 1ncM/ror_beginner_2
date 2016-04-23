class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_train, :set_stations, only: [:new, :create]
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = @user
      if @ticket.save
        redirect_to user_tickets_path(@user, @ticket), notice: 'Билет успешно создан'
      else
        render :new
      end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        redirect_to @ticket
      else
        render :edit
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    redirect_to user_tickets_path(@user)
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def set_train
      @train = Train.find(ticket_params[:train_id])
    end

    def set_stations
      @first_station = RailwayStation.find(ticket_params[:railway_station_first_id])
      @last_station = RailwayStation.find(ticket_params[:railway_station_last_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:number, :user_id, :train_id, :railway_station_first_id, :railway_station_last_id, :owner, :passport)
    end
end
