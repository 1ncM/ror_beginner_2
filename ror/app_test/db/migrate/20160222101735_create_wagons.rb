class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.integer :number
      t.string  :wagon_type
      t.integer :train_id
      t.integer :up_seats
      t.integer :down_seats
      t.timestamps null: false
    end
  end
end
