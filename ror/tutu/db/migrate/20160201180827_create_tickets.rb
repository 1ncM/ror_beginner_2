class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :number
      t.integer :railway_station_last_id
      t.timestamps null: false
    end
    add_belongs_to :tickets, :railway_station_first
  end
end
