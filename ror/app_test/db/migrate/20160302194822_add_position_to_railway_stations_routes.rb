class AddPositionToRailwayStationsRoutes < ActiveRecord::Migration
  def change
  	add_column :routes_stations, :position, :integer
  end
end
