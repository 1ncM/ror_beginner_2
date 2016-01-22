class Wagon
  attr_reader :type

  include Company
  include InstanceCounter

  def initialize(_number_of_seats)
    register_instance
  end
end
