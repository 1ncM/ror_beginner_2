class RailwayStation
  attr_reader :name, :trains
  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end
  
  def self.all_stations
    @@stations
  end

  def arrive_train(train)     
    trains << train
  end
  
  def departure_train(train)
    trains.delete(train)
  end
  
  def trains_type(type)         
    trains.each {|i| puts i if i.type == type}
  end
  
  def to_s
    "#{name}"
  end
end