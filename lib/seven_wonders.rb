
require 'httparty'

URL = "https://us1.locationiq.com/v1/search.php"
API_KEY = ENV["API_TOKEN"]
FORMAT="json"

def get_locations(locations)
  result =  {}

  locations.each do |location_name|
    url = "#{URL}?key=#{API_KEY}&q=#{location_name}&format=#{FORMAT}"
    puts url
    response = HTTParty.get(url)
    sleep(2)
    if !response.nil? && response[0]
      result[location_name] = {
         "lat" => response[0]["lat"],
         "lon" => response[0]["lon"]
      }
    end
  end
  return result
end


