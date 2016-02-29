class Wagon < ActiveRecord::Base
  belongs_to :train
  validates :train, presence: true
  validates :number, presence: true, uniqueness: { scope: :train_id }
  before_validation :set_number

  # default_scope { order(:number) }
  private

  def set_number
    last_number = train.wagons.maximum(:number) || 0
    self.number = last_number + 1
  end
end
