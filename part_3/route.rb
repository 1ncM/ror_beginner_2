class Route
  attr_reader :stations
  def initialize(first_station,last_station)
    @stations = [first_station,last_station]
  end
  def add_station(station)
    stations.insert(-2, station)
  end
  def delete_station(station)
    stations.delete(station)
  end
  def to_s
  	p @stations.map {|i| i.name }
  end
end

