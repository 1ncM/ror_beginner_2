class CreateRoutesStations < ActiveRecord::Migration
  def change
    create_table :routes_stations do |t|
      t.integer :railway_station_id
      t.integer :route_id
    end
  end
end
