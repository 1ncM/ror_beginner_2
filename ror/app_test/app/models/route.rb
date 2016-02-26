class Route < ActiveRecord::Base
  has_many :trains
  has_many :routes_stations
  has_many :railway_stations, through: :routes_stations
end
