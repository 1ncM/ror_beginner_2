class RailwayStation < ActiveRecord::Base
  has_many :routes_stations
  has_many :routes, through: :routes_stations

  scope :ordered, -> {joins(:routes_stations).order("routes_stations.position").uniq}

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def departure_time(route)
    station_route(route).try(:departure_time)
  end

  def arrive_time(route)
    station_route(route).try(:arrive_time)
  end

  def update_departure_time(route, value)
    obj = station_route(route)
    obj.update(departure_time:value) if obj
  end

  def update_arrive_time(route, value)
    obj = station_route(route)
    obj.update(arrive_time: value) if obj
  end

  protected

  def station_route(route)
  	@station_route ||= routes_stations.where(route: route).first
  end

end