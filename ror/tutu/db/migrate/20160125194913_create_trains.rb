class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.integer :train_number
      t.string :first_station
      t.string :last_station
      t.timestamps null: false
    end
  end
end
