namespace :earthquake do
  desc "GET DATA FROM USGS API"
  task get_data: :environment do
    url_api = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson' # Past 30 Days
    response = HTTParty.get(url_api)
    if response.success?
      data = JSON.parse(response.body)
      #rangos para magnitude [-1.0, 10.0], latitude[1] [-90.0, 90.0] y longitude[0]: [-180.0, 180.0]
      earthquake_invalid=0
      new_earthquake=0
      data["features"].each do |feature|
        feature_id =  feature['id']
        longitude =   feature['geometry']['coordinates'][0]
        latitude =    feature['geometry']['coordinates'][1]
        magnitude =   feature['properties']['mag']
        place =       feature['properties']['place']
        time =        feature['properties']['time']
        url =         feature['properties']['url']
        tsunami =     feature['properties']['tsunami']
        mag_type =    feature['properties']['magType']
        title =       feature['properties']['title']
        type =        feature['type']


        #validate range and id earthquake
        if Eventearthquake.exists?(external_id: feature_id) || !(magnitude.between?(-1.0,10.0) && latitude.between?(-90.0,90.0) && longitude.between?(-180.0,180.0))
          earthquake_invalid+=1
          next
        end
        #save on db
        Eventearthquake.create(type: type,external_id: feature_id, magnitude: magnitude, place: place, time: time, tsunami: tsunami, mag_type:mag_type, title: title, longitude: longitude, latitude: latitude, url: url)
        new_earthquake+=1
     
      end
      puts "found #{earthquake_invalid} with id exist on db or range to lat and long invali, and create #{new_earthquake} news earthquake"
    else
      puts "Error al obtener datos corriendo la tarea earthquake:get_data #{response.code}"
    end
  end

end
