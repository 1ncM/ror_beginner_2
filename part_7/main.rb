require_relative 'instance_counter.rb'
require_relative 'company.rb'
require_relative 'route.rb'
require_relative 'railway_station.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'passanger_train.rb'
require_relative 'wagon.rb'
require_relative 'cargo_wagon.rb'
require_relative 'passanger_wagon.rb'

# station1 = RailwayStation.new("Perovo")      
# station2 = RailwayStation.new("Novogireevo")
# station3 = RailwayStation.new("Novokosino")
# station4 = RailwayStation.new("Baumanskaya")
# station5 = RailwayStation.new("Belorusskaya")

# route = Route.new(station1,station5)

# route.add_station(station2)
# route.add_station(station3)
# route.add_station(station4)

# # puts train1, route, station1

# passanger_train = PassangerTrain.new("A",60)
# cargo_train = CargoTrain.new("B",100)
# puts passanger_train
# puts cargo_train

# passanger_wagon = PassangerWagon.new
# cargo_wagon = CargoWagon.new

# passanger_train.add_wagon cargo_wagon
# puts passanger_train
# passanger_train.add_wagon passanger_wagon
# puts passanger_train
# cargo_train.add_wagon passanger_wagon
# puts cargo_train
# cargo_train.add_wagon cargo_wagon
# puts cargo_train

# cargo_train.set_route(route)
# puts route
# cargo_train.set_route route
# puts cargo_train.current_station
# cargo_train.go_station station3
# puts cargo_train.current_station
# cargo_train.go_station station2
# puts cargo_train.current_station

	# текстовый интерфейс
# puts "Список команд: \n _Создать станцию \n _Создать поезд \n _Добавить/Отцепить вагон \n _Поместить поезд на станцию \n _Список станций \n _Список поездов \n _Выйти"
# stations = []
# trains = []
# loop do
# command = gets.chomp
# break if command == "_Выйти"
# case command
# # Создавать станции
#   when "_Создать станцию" 
#     puts "	Введите название станции"
#     name_station = gets.chomp
#     stations << station = RailwayStation.new(name_station)
# 	puts "	Создана станция #{station.name}"  
# # Помещать поезда на станцию
#   when "_Поместить поезд на станцию"
#   	puts "  Выбирите поезд из списка: #{trains.map {|j| j.name}}"
#     train_name = gets.chomp
#     puts "  Выбирите станцию из списка: #{stations.map {|k| k.name}}"
#     station_name = gets.chomp
#     stations.each {|i| @station = i.arrive_train(trains.map {|l| l if l.name == train_name}) if i.name == station_name}
#     puts "на станцию #{station_name} добавлен поезд #{train_name} : #{@station}"
# # Создавать поезда
#   when "_Создать поезд"
#   	puts "  Введите тип поезда"
#   	type = gets.chomp.strip.to_sym
#   	puts "	Введите название, количество вагонов поезда"
#   	name,number = gets.chomp.split(",")
#   	if type == :Passanger
#       trains << PassangerTrain.new(name.strip,number.strip.to_i)
#   	elsif type == :Cargo
#   	  trains << CargoTrain.new(name.strip,number.strip.to_i)
#     else
#       puts "Неверный тип"
#     end
#   	puts "	Создан поезд #{trains.last}"
# # Добавлять вагоны к поезду
#   when "_Добавить вагон"
#   	puts "	Выбирите поезд из списка: #{trains.map {|j| j.name}}"
#   	train_name = gets.chomp
#   	trains.each {|i| @train = i if i.name == train_name} 
#   	@train.add_wagon(@train.type == :Cargo ? CargoWagon.new : PassangerWagon.new)
#   	puts "	Добавлен вагон, количество вагонов:#{@train.number}"
# # Отцеплять вагоны от поезда
#   when "_Отцепить вагон"
#   	puts "	Выбирите поезд из списка: #{trains.map {|j| j.name}}"
#   	train_name = gets.chomp
#   	trains.map {|i| @train = i if i.name == train_name}
#   	@train.delete_wagon
#   	puts "	Отцеплен вагон, количество вагонов:#{@train.number}"
# # Просматривать список станций и список поездов на станции
#   when "_Список станций"
#   	puts stations
#   when "_Список поездов"
#     puts "  Выбирите станцию из списка: #{stations.map {|k| k.name}}"
#   	station = gets.chomp
#     stations.each {|i| puts i.trains if i.name == station}
#   else 
#   	puts "  Неверная команда"
# end 
# end

# class Application
 
#  #@@trains = {}

#   def initialize
#   	start
#   end

#   def start
#   	loop do
#   	  menu
#   	  puts "\n Введите команду"
#       command = gets.chomp
#       break if command == "Стоп"
#     case command
#       when "_Создать поезд"
#         create_train
#       when "_Создать станцию"
#       	create_station
#       when "_Создать маршрут"
#       	create_route
#     end
#   	end
#   end

# private
  
#   def menu
#     puts "\n Список команд: \n _Создать станцию \n _Создать поезд \n _Добавить/Отцепить вагон \n _Поместить поезд на станцию \n _Список станций \n _Список поездов \n _Выйти"
#   end

#   def create_train
#   	puts "  Введите тип поезда (Cargo/Passanger)"
#   	type = gets.chomp.strip.to_sym
#   	puts "	Номер, название, количество вагонов поезда"
#   	train_number,name,number = gets.chomp.split(",")
#   	if type == :Passanger
#       PassangerTrain.new(train_number,name.strip,number.strip.to_i)
#   	  puts "создан поезд, #{Train.find(train_number)}"
#   	elsif type == :Cargo
#       CargoTrain.new(train_number,name.strip,number.strip.to_i)
#       puts "создан поезд, #{Train.find(train_number)}"
#     else
#       puts "Неверный тип поезда"
#     end
#   	rescue Exception => e
#       	puts e
#   end

#   def create_station
#     puts "Введите название станции"
#     station_name = gets.chomp.strip
#     station = RailwayStation.new(station_name)
#     puts "Создана станция #{station}"
#   rescue Exception => e
#   	puts e
#   end

#   def create_route
#     puts "Введите начальную и конечную станции"
#     first,last = gets.chomp.split(',')
#     route = Route.new(RailwayStation.new(first),RailwayStation.new(last))
#     p "Создан маршрут #{route}"
#   rescue Exception => e
#   	puts e
#   end
# end
# Application.new

# train1 = Train.new(1212,"AKA",10)
# p train = PassangerTrain.new("sss-44","123qwesdf", 345)
#  tr = CargoTrain.new("sss-34","235wersdfg", 333)
#  er = CargoTrain.new("sss-34","235wersdfg", 333)
# p train.valid?

# wag = PassangerWagon.new
# w = CargoWagon.new
# p train.add_wagon wag
# p train.wagons

# st = RailwayStation.new("Perovo")
# p st.valid?
# p r = Route.new(st,st)
# p r.stations
# p r.valid?
# r.add_station st
# st.arrive_train train

# p train.number
# puts train2
# p train.valid?
# p train
# p Train.find("sss44")
# p train2.valid?

# puts Train.instances
# stations = RailwayStation.new("Perovo")
# stations1 = RailwayStation.new("P")
# p RailwayStation.instances
# wagon1 = CargoWagon.new
# wagon2 = CargoWagon.new
# wagon3 = Wagon.new
# puts CargoWagon.instances

# train1.company = "Japan"
# train2.company = "China"
# puts train1.company
# puts train2.company
# puts Train.find(1212)
# puts Train.find(2121)
# wagon1 = PassangerWagon.new
# wagon2 = CargoWagon.new
# wagon1.company = "Samsung"
# wagon2.company = "Bosch"
# puts wagon1.company
# puts wagon2.company

station = RailwayStation.new "Perovo"
station1 = RailwayStation.new "Novogireevo"
station = RailwayStation.new "Kolokolo"
 tr = PassangerTrain.new("sss-34","235wersdfg", 333)
 er = PassangerTrain.new("sss-11","235wersdfg", 333)
 wr = CargoTrain.new("sss-04","235wersdfg", 333)

wagon2 = PassangerWagon.new 45
wagon3 = PassangerWagon.new 34
wagon4 = CargoWagon.new 45
wagon5 = CargoWagon.new 34
tr.add_wagon wagon2
er.add_wagon wagon3
wr.add_wagon wagon4
wr.add_wagon wagon5
station.arrive_train tr
station1.arrive_train er
station1.arrive_train wr
# tr.meth {|x| puts x}
# puts station.trains

RailwayStation.all_stations {|x| x}
# station1 = RailwayStation.new "A"
# station2 = RailwayStation.new "B"
# station3 = RailwayStation.new "C"
# puts RailwayStation.all_stations
# p Hash.new = (2..5).each {|i| Hash[i] = "Free"}

# psw = PassangerWagon.new(5)
# psw.take_the_place_of(2)
# psw.take_the_place_of(5)
# psw.take_the_place_of(4)
# p psw.number_of_seats
# p psw.free_places

# cw = CargoWagon.new(100)
# p cw.overall_volume
# cw.take_the_volume 20
# p cw.overall_volume