class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.datetime :start_date
      t.datetime :end_date
      t.integer :start_station_id
      t.integer :end_station_id
      t.integer :bike_id
      t.string :subscription_type
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
