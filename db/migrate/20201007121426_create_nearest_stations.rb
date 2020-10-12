class CreateNearestStations < ActiveRecord::Migration[5.2]
  def change
    create_table :nearest_stations do |t|
      t.string :line_name
      t.string :station_name
      t.integer :walking_minutes
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
