class AddTimeToRouteStations < ActiveRecord::Migration
  def change
  	add_column :routes_stations, :arrive_time, :datetime
  	add_column :routes_stations, :departure_time, :datetime
  end
end
