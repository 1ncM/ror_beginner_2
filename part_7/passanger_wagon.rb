class PassangerWagon < Wagon
  attr_reader :number_of_seats
  def initialize(number_of_seats)
  	@number_of_seats = {}
  	(1..number_of_seats).each {|i| @number_of_seats[i] = "Free"}
  	super
  	@type = :Passanger
  end

  def take_the_place_of(place) # занять место
    number_of_seats[place] = "Reserved"
  end

  def busy_places # количество занятых мест в вагоне
    (number_of_seats.reject {|k,v| v == "Free"}).count
  end

  def free_places # количество свободных мест в вагоне
    (number_of_seats.reject {|k,v| v == "Reserved"}).count
  end

  def to_s
    "Type: #{type} , Busy places: #{busy_places}, Free places: #{free_places}"#, Ovarall volume: #{overall_volume}
  end
private
  attr_writer :number_of_seats
end
