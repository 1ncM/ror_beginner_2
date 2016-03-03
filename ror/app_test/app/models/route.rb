class Route < ActiveRecord::Base
  has_many :trains
  has_many :routes_stations
  has_many :railway_stations, through: :routes_stations
  
  validates :name, presence: true
  validate :stations_count
  before_validation :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end
end
