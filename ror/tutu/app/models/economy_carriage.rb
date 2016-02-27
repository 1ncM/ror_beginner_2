class EconomyCarriage < Vagon
  validates :side_up_seat, :side_down_seat, presence: true
end