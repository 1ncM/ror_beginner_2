class PassangerTrain < Train
  def initialize(train_number,name,number)
    super
	@type = :Passanger
  end
end