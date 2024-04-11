class CreateEventearthquakes < ActiveRecord::Migration[7.1]
  def change
    create_table :eventearthquakes do |t|
      t.string :type
      t.string :external_id
      t.decimal :magnitude, precision: 9, scale: 6
      t.string :place
      t.string :time
      t.boolean :tsunami
      t.string :mag_type
      t.string :title
      t.decimal :longitude, precision: 9, scale: 6
      t.decimal :latitude, precision: 9, scale: 6
      t.string :url

      t.timestamps
    end
  end
end
