class CargoWagon < Wagon
  attr_reader :overall_volume, :occupied_volume
  def initialize(overall_volume)
  	@overall_volume = overall_volume
  	@occupied_volume = 0
  	super
    @type = :Cargo
  end

  def take_the_volume(volume) # занимаем объем в вагоне
    raise "Недостаточно свободного объема" if overall_volume < volume 
    occupied_volume += volume
  end

  def available_capacity # доступный объем
    overall_volume - occupied_volume
  end
  
  def to_s
    "    Number: #{rand(100)}, Type: #{type}, Free volume: #{available_capacity}, Occupied volume: #{occupied_volume}"
  end

  private 

  attr_writer :overall_volume, :occupied_volume
end