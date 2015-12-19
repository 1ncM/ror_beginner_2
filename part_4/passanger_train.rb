class PassangerTrain < Train
  def initialize(name,number)
    super
	@type = :Passanger
  end
end