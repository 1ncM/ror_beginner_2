class CreateVagons < ActiveRecord::Migration
  def change
    create_table :vagons do |t|
      t.integer :vagon_number
      t.string :vagon_type
      t.integer :up_seat
      t.integer :down_seat
      t.timestamps null: false
    end
  end
end
