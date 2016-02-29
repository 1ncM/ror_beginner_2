class Route < ActiveRecord::Base
  has_many :trains
  has_many :routes_stations
  has_many :railway_stations, through: :routes_stations

  before_validation :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end
end
