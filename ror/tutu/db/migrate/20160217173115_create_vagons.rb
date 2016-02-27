class CreateVagons < ActiveRecord::Migration
  def change
    create_table :vagons do |t|
      t.integer :number
      t.integer :up_seat
      t.integer :down_seat
      t.integer :side_up_seat
      t.integer :side_down_seat
      t.integer :seat_place
      t.string :type
      t.timestamps null: false
    end
  end
end
