class Api::FeaturesController < ApplicationController
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 100
    mag_types = (params[:mag_type] ) || []


    # Eliminar elementos vacíos y asegurarse de que haya solo un nivel de array
    mag_types = mag_types.flatten.reject(&:empty?) || []


    #@earthquakes = Eventearthquake.limit(50).offset(50)
    
    #all earthquake
    features_query = Eventearthquake.all
    
    #if filters mag_type
    if mag_types.any?
      mag_types = mag_types[0].split("'") 
      features_query = features_query.where(mag_type: mag_types )
    end

    earthquake = features_query.paginate(page: page, per_page: per_page)
    render json: {
      #data: @earthquakes.map {|earthquake| serialize_earthquake(earthquake)},
      data: serialize_earthquake(earthquake),
      pagination:{
        current_page: earthquake.current_page,
        total:earthquake.total_entries,
        per_page: earthquake.per_page,
      },
      filter: {
        page: page,
        per_page: earthquake.per_page,
        mag_type:mag_types,

      },
    }, status: :ok
  end


  private

  def serialize_earthquake(earthquakes)
    earthquakes.map do |earthquake|
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


end