class CoupeCarriage < Vagon
  validates :up_seat, :down_seat, presence: true
end