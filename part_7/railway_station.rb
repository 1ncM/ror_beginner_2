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

  def meth(&block)
    block.call(trains.each {|i| i})
  end

  def valid?
    validate!
  rescue
    false
  end
  
  def self.all_stations(&block)
      block.call(@@stations.each do |i|
       puts i
       puts i.trains.each {|k| k}
       i.trains.each {|l| puts l.wagons}
     end)
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