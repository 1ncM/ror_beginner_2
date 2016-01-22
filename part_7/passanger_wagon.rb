class PassangerWagon < Wagon
  attr_reader :number_of_seats
  def initialize(number_of_seats)
    @number_of_seats = {}
    (1..number_of_seats).each { |i| @number_of_seats[i] = 'Free' }
    super
    @type = :Passanger
  end

  def take_the_place_of(place)
    number_of_seats[place] = 'Reserved'
  end

  def busy_places
    (number_of_seats.reject { |_k, v| v == 'Free' }).count
  end

  def free_places
    (number_of_seats.reject { |_k, v| v == 'Reserved' }).count
  end

  def to_s
    "Busy places: #{busy_places}, Free places: #{free_places}"
  end

  private

  attr_writer :number_of_seats
end
