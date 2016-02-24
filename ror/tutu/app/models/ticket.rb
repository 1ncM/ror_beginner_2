class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :railway_station_first_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :railway_station_last_id
  validates :number, :owner, presence: true
end
