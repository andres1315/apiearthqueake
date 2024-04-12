class ChangeTypeTime < ActiveRecord::Migration[7.1]
  def change
    change_column :eventearthquakes, :time, :bigint
  end
end
