class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.integer :number
      t.integer :train_id
      t.integer :up_seats
      t.integer :down_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :seat_place
      t.belongs_to :train
      t.string :type
      t.timestamps null: false
    end
  end
end
