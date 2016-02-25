require_relative 'route.rb'
require_relative 'railway_station.rb'
require_relative 'train.rb'

station1 = RailwayStation.new("Perovo")      
station2 = RailwayStation.new("Novogireevo")
station3 = RailwayStation.new("Novokosino")
station4 = RailwayStation.new("Baumanskaya")
station5 = RailwayStation.new("Belorusskaya")

train1 = Train.new("Zvezda","Passanger", 50)
train2 = Train.new "Lasto4ka","Cargo", 100

route = Route.new(station1,station5)

