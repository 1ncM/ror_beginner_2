class Train
  attr_accessor :speed
  attr_reader :number, :route, :current_station, :type, :name, :train_number
  include Company
  @@trains = {}
  def initialize(train_number,name,number)
    @name = name
    @type = type
    @number = number
    @speed = 0
    @train_number = train_number
    @@trains[train_number] = self
  end

  def self.find(train_number)
    @@trains[train_number]
  end

  def add_wagon(wagon)
    self.number += 1 if train_stopped? && type_check?(wagon)
  end

  def delete_wagon
    self.number -= 1 if train_stopped? && number>0
  end

  def set_route(route)
    self.route = route
    self.current_station = route.stations.first
  end

  def go_station(station)
    self.current_station = station if valid_movement?(station)
  end

  def next_station
    route.stations[route.stations.index(current_station) + 1]
  end

  def prev_station
    route.stations[route.stations.index(current_station) - 1]
  end

  def to_s
    "Номер: #{train_number}, Имя: #{name}, Тип: #{type}, Вагонов: #{number}"
  end

protected # в этой секции планируется использовать в подклассах
  # данные атрибуты не должны устанавливаться из вне
  attr_writer :number, :current_station, :route
  # данные методы не должны вызываться из вне
  def type_check?(wagon)
    type == wagon.type
  end

  def train_stopped?
    speed.zero?
  end

  def valid_movement?(station)
    route.stations.include?(station) && 
    (self.next_station || self.prev_station) == station
  end
end
