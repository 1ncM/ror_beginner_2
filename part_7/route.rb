class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(first_station,last_station)
    @stations = [first_station,last_station]
    register_instance
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def add_station(station)
    stations.insert(-2, station)
    valid_station(station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def to_s
  	p @stations.map {|i| i.name }
  end

private 
  
  def validate!
    raise "invalid station type" if (stations[0].class && stations[-1].class) != RailwayStation
    true
  end

  def valid_station(station)
    raise "invalid type station" if station.class != RailwayStation
  end
end

