class Train
  attr_accessor :speed
  attr_reader :number, :route, :current_station, :type, :name
  def initialize(name,type,number)
    @name = name
    @type = type
    @number = number
    @speed = 0
    @route = []
  end
  def add_wagon
    self.number += 1 if speed.zero?
  end
  def delete_wagon
    self.number -= 1 if speed.zero? && number>0
  end
  def get_route(route)
    self.route << route
    self.current_station = route.stations.first
  end
  def go_station(station)
    route.first.stations.each {|i| self.current_station = i if i.name == station} 
  end
  def next_station
    route.first.stations[route.first.stations.index(current_station) + 1]
  end
  def prev_station
    route.first.stations[route.first.stations.index(current_station) - 1]
  end
  def to_s
    "Имя: #{name}, Тип: #{type}, Вагонов: #{number}, Маршрут: #{route}"
  end
private
  attr_writer :number, :current_station
end
