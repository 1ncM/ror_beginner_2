require_relative 'route.rb'
require_relative 'railway_station.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'passanger_train.rb'
require_relative 'cargo_wagon.rb'
require_relative 'passanger_wagon.rb'

station1 = RailwayStation.new("Perovo")      
station2 = RailwayStation.new("Novogireevo")
station3 = RailwayStation.new("Novokosino")
station4 = RailwayStation.new("Baumanskaya")
station5 = RailwayStation.new("Belorusskaya")

route = Route.new(station1,station5)

route.add_station(station2)
route.add_station(station3)
route.add_station(station4)

# puts train1, route, station1

passanger_train = PassangerTrain.new("A",60)
cargo_train = CargoTrain.new("B",100)
puts passanger_train
puts cargo_train

passanger_wagon = PassangerWagon.new
cargo_wagon = CargoWagon.new

# passanger_train.add_wagon cargo_wagon
# puts passanger_train
# passanger_train.add_wagon passanger_wagon
# puts passanger_train
cargo_train.add_wagon passanger_wagon
puts cargo_train
cargo_train.add_wagon cargo_wagon
puts cargo_train

cargo_train.set_route(route)
puts route
cargo_train.set_route route
puts cargo_train.current_station
cargo_train.go_station station3
puts cargo_train.current_station
cargo_train.go_station station2
puts cargo_train.current_station
