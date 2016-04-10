class Train < ActiveRecord::Base
  belongs_to :route
  has_many :tickets
  has_many :wagons

  def wagon_type(type)
    wagons.where(type: type)
  end
end
