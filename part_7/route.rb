class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
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
    p @stations.map(&:name)
  end

  private

  def validate!
    if (stations[0].class && stations[-1].class) != RailwayStation
      fail 'train type error'
    end
    true
  end

  def valid_station(station)
    fail 'invalid type station' if station.class != RailwayStation
  end
end
