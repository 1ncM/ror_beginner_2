class Route
  attr_reader :stations
  def initialize
    @stations = []
  end
  def add_station(station)
    stations << station
  end
  def delete_station(station)
    stations.delete(station)
  end
  def to_s
  	"Маршрут: #{stations}"
  end
end
