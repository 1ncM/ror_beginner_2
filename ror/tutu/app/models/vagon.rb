class Vagon < ActiveRecord::Base
  belongs_to :train
  validates :number, presence: true, uniqueness: { scope: :train_id }
  # validate :valid_number
  after_validation :set_number
  private

  def set_number
    last_number = train.vagons.maximum(:number) || 0
    self.number = last_number + 1
  end

  # def valid_number
  # 	if self.train.vagons.include?(self.number)
  # 	  'Такой вагон существует'
  # 	end
  # end
end
