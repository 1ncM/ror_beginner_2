class CargoTrain < Train
  def initialize(train_number,name,number)
    super
   	@type = :Cargo
  end
end