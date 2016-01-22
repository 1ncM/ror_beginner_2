class CargoWagon < Wagon
  attr_reader :overall_volume, :occupied_volume
  def initialize(overall_volume)
    @overall_volume = overall_volume
    @occupied_volume = 0
    super
    @type = :Cargo
  end

  def take_the_volume(volume)
    fail 'not enough space' if overall_volume < volume
    occupied_volume + volume
  end

  def available_capacity
    overall_volume - occupied_volume
  end

  def to_s
    "Type: #{type}, Free: #{available_capacity}, Occupied: #{occupied_volume}"
  end

  private

  attr_writer :overall_volume, :occupied_volume
end
