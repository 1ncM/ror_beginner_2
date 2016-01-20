class RailwayStation
  attr_reader :name, :trains
  include InstanceCounter
  @@stations = []

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance

  end

  def each_train(&block)
    trains.each {|i| block.call(i)}
  end

  def valid?
    validate!
  rescue
    false
  end
  
  def self.all_stations
    @@stations
  end

  def arrive_train(train)     
    trains << train
    valid_arrive(train)
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

private

  def validate!
    raise "invalid name type" if name.class != String
    raise "long name" if name.size > 20
    true
  end

  def valid_arrive(train)
    raise "invalid train type" if (train.class && train.class.superclass) != Train
  end

end