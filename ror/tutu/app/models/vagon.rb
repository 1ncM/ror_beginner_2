class Vagon < ActiveRecord::Base
  belongs_to :train
  before_validation :set_number
  private

  def set_number
  	self.number = self.class.all.count.to_i + 1
  end

  def valid_number
  end
end
