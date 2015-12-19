class CargoTrain < Train
  def initialize(name,number)
    super
   	@type = :Cargo
  end
end