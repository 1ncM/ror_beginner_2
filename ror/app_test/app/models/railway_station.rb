class RailwayStation < ActiveRecord::Base
  has_many :routes_stations
  has_many :routes, through: :routes_stations

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  protected

  def station_route(route)
  	@station_route ||= routes_stations.where(route: route).first
  end

end