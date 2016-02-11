class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.integer :train_number
      t.timestamps null: false
    end
  end
end
