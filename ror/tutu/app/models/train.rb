class Train < ActiveRecord::Base
  belongs_to :route
  has_many :tickets
  has_many :vagons
  validates :train_number, presence: true, uniqueness: true
end
