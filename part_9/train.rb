class Train
  attr_accessor :speed
  attr_reader :number, :route, :current_station, :type,
              :name, :train_number, :wagons
  extend MyAccessor
  include Company
  include InstanceCounter
  @@trains = {}
  TRAIN_FORMAT = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i
  def initialize(train_number, name, number)
    @name = name.strip
    @type = type
    @number = number
    @speed = 0
    @wagons = []
    @train_number = train_number
    global_valid_train!(train_number)
    @@trains[train_number] = self
    register_instance
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def self.find(train_number)
    @@trains[train_number]
  end

  def each_wagon(&_block)
    wagons.each { |i| yield i }
  end

  def add_wagon(wagon)
    valid_wagon(wagon)
    (self.number += 1) && (wagons << wagon) if train_stopped?
  end

  def delete_wagon
    self.number -= 1 if train_stopped? && number > 0
  end

  def take_the_route(route)
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

  protected

  attr_writer :number, :current_station, :route

  def train_stopped?
    speed.zero?
  end

  def valid_movement?(station)
    route.stations.include?(station) &&
      (next_station || prev_station) == station
  end

  def validate!
    # fail 'name is the String!' unless name.class == String
    fail 'empty name!' if name.empty?
    fail 'number is the Fixnum!' unless number.class == Fixnum
    fail 'number must be greater than 0' unless number > 0
    fail 'train_number not valid!' if train_number !~ TRAIN_FORMAT
    true
  end

  def valid_wagon(wagon)
    fail 'invalid wagon type' if type != wagon.type
  end

  def global_valid_train!(train_number)
    fail 'train already exists' if @@trains.key?(train_number)
  end
end
