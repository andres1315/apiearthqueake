class Api::FeaturesController < ApplicationController
  def index
    @earthquakes = Eventearthquake.limit(50).offset(50)
    render json: {
      data: @earthquakes.map {|earthquake| serialize_earthquake(earthquake)},

    }, status: :ok
  end


  private

  def serialize_earthquake(earthquake)
    {
      id:   earthquake.id,
      type: earthquake.type.downcase,
      attributes: {
        external_id:  earthquake.external_id,
        magnitude:    earthquake.magnitude.to_f,
        place:        earthquake.place,
        time:         earthquake.time,
        tsunami:      earthquake.tsunami,
        mag_type:     earthquake.mag_type,
        title:        earthquake.title,
        coordinates: {
          longitude:  earthquake.longitude.to_f,
          latitude:   earthquake.latitude.to_f,
        }
      },
      links: {
        external_url: earthquake.url
      }

    }
  end


end