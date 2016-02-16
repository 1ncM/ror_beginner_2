require_relative 'acc.rb'
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


station1 = RailwayStation.new 'Perovo'
station2 = RailwayStation.new 'Novogireevo'
station3 = RailwayStation.new 'Entuziastov'
tr = PassangerTrain.new('sss-34', '235wersdfg', 333)
er = PassangerTrain.new('sss-11', '235wersdfg', 333)
wr = CargoTrain.new('sss-04', '235wersdfg', 333)

wagon2 = PassangerWagon.new 45
wagon3 = PassangerWagon.new 34
wagon4 = CargoWagon.new 45
wagon5 = CargoWagon.new 34
tr.add_wagon wagon2
er.add_wagon wagon3
wr.add_wagon wagon4
wr.add_wagon wagon5
station1.arrive_train tr
station2.arrive_train er
station3.arrive_train wr

# RailwayStation.all_stations.each do |i|
#   puts i
#   i.each_train do |t|
#     puts t
#     t.each_wagon { |w| puts w }
#   end
# end
Train.att_accessor_with_history(:history,:sdf,:qwe)
tr.history = 10
p tr.history
tr.history =1111
p tr.sdf = 1111
p tr.sdf