require_relative 'route.rb'
require_relative 'railway_station.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'passanger_train.rb'
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
puts "Список команд: \n _Создать станцию \n _Создать поезд \n _Добавить/Отцепить вагон \n _Поместить поезд на станцию \n _Список станций \n _Список поездов \n _Выйти"
stations = []
trains = []
loop do
command = gets.chomp
break if command == "_Выйти"
case command
# Создавать станции
  when "_Создать станцию" 
    puts "	Введите название станции"
    name_station = gets.chomp
    stations << station = RailwayStation.new(name_station)
	puts "	Создана станция #{station.name}"  
# Помещать поезда на станцию
  when "_Поместить поезд на станцию"
  	puts "  Выбирите поезд из списка: #{trains.map {|j| j.name}}"
    train_name = gets.chomp
    puts "  Выбирите станцию из списка: #{stations.map {|k| k.name}}"
    station_name = gets.chomp
    stations.each {|i| @station = i.arrive_train(trains.map {|l| l if l.name == train_name}) if i.name == station_name}
    puts "на станцию #{station_name} добавлен поезд #{train_name} : #{@station}"
# Создавать поезда
  when "_Создать поезд"
  	puts "  Введите тип поезда"
  	type = gets.chomp.strip.to_sym
  	puts "	Введите название, количество вагонов поезда"
  	name,number = gets.chomp.split(",")
  	if type == :Passanger
      trains << PassangerTrain.new(name.strip,number.strip.to_i)
  	elsif type == :Cargo
  	  trains << CargoTrain.new(name.strip,number.strip.to_i)
    else
      puts "Неверный тип"
    end
  	puts "	Создан поезд #{trains.last}"
# Добавлять вагоны к поезду
  when "_Добавить вагон"
  	puts "	Выбирите поезд из списка: #{trains.map {|j| j.name}}"
  	train_name = gets.chomp
  	trains.each {|i| @train = i if i.name == train_name} 
  	@train.add_wagon(@train.type == :Cargo ? CargoWagon.new : PassangerWagon.new)
  	puts "	Добавлен вагон, количество вагонов:#{@train.number}"
# Отцеплять вагоны от поезда
  when "_Отцепить вагон"
  	puts "	Выбирите поезд из списка: #{trains.map {|j| j.name}}"
  	train_name = gets.chomp
  	trains.map {|i| @train = i if i.name == train_name}
  	@train.delete_wagon
  	puts "	Отцеплен вагон, количество вагонов:#{@train.number}"
# Просматривать список станций и список поездов на станции
  when "_Список станций"
  	puts stations
  when "_Список поездов"
    puts "  Выбирите станцию из списка: #{stations.map {|k| k.name}}"
  	station = gets.chomp
    stations.each {|i| puts i.trains if i.name == station}
  else 
  	puts "  Неверная команда"
end 
end
