class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :number
      t.integer :railway_station_last_id
      t.integer :railway_station_first_id
      t.string :owner
      t.timestamps null: false
    end
  end
end
