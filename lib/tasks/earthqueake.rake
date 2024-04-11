namespace :earthqueake do
  desc "GET DATA FROM USGS API"
  task get_data: :environment do
    url_api = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson' # Past 30 Days
    response = HTTParty.get(url_api)
    if response.success?
      data = JSON.parse(response.body)
      
    else
      puts "Error al obtener datos #{response.code}"
    end
  end

end
