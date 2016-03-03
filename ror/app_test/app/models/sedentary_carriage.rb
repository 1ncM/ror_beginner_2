class SedentaryCarriage < Wagon
  validates :seat_place, presence: true
end