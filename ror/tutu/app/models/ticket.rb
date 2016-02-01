class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  validates :number, presence: true, uniqueness: true
end
