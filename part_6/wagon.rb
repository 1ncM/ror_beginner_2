class Wagon
  attr_reader :type
  include Company
  include InstanceCounter
  def initialize
    register_instance	
  end
end