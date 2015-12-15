class RailwayStation
  attr_reader :name, :trains
  def initialize(name)
    @name = name
    @trains = []
  end
  def get_train(train)     
    trains << train
  end
  def send_train(train)
    trains.delete(train)
  end
  def trains_type(type)         
    trains.each {|i| puts i if i.type == type}
  end
  def to_s
    "Станция: #{name}, Поезда на станции: #{trains}"
  end
end