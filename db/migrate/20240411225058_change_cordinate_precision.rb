class ChangeCordinatePrecision < ActiveRecord::Migration[7.1]
  def change
    change_column :eventearthquakes, :magnitude, :decimal, precision: 10, scale: 6
    change_column :eventearthquakes, :latitude, :decimal, precision: 10, scale: 6
    change_column :eventearthquakes, :longitude, :decimal, precision: 10, scale: 6
  end
end
