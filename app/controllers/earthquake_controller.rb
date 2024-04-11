class EarthquakeController < ApplicationController
  def index
    @earthquakes = Eventearthquake.where(type: 'Feature')
    render json: @earthquakes, status: :ok
  end



end