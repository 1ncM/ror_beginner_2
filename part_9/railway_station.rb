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

  def each_train(&_block)
    trains.each { |i| yield i }
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
    trains.each { |i| puts i if i.type == type }
  end

  def to_s
    name.to_s
  end

  private

  def validate!
    fail 'invalid name type' if name.class != String
    fail 'long name' if name.size > 20
    true
  end

  def valid_arrive(train)
<<<<<<< HEAD
    fail 'invalid train type' if (train.class && train.superclass) != Train
=======
    fail 'invalid train type' if (train.class && train.class.superclass) != Train
>>>>>>> master
  end
end
