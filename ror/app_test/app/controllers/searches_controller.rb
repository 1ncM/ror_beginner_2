class SearchesController < ApplicationController

  def show
    if params[:arrive_station] && params[:departure_station]
      @arrive_station = RailwayStation.find(params[:arrive_station])
      @departure_station = RailwayStation.find(params[:departure_station])
      @routes = @arrive_station.routes & @departure_station.routes
    end  
  end

end