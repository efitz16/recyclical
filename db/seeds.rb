client = SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => ENV['DISPOSAL_NETWORKS']})

results = client.get("9m2c-n6wx", :$limit => 5000)

materials = ["food", "textiles", "clothing", "electronics"]

materials.each do |m|
  MaterialType.create(name: m)
end

results.each do |result|
  location = Location.new(longitude: result["location_1"]["coordinates"][0].to_f, latitude: result["location_1"]["coordinates"][1].to_f)
  location.material_types << MaterialType.find_by(name: "food")
  location.save
end

electronics_results = client.get("mhj7-c4jc", :$limit => 5000)

# electronics_results.each do |result|
# 	location = Location.new(raw_address: result[][])
# 	location.material_types << MaterialType.find_by(name: "food")
#     location.save
# end

electronics_places = []

manhattan_location = electronics_results.find { |r| r["borough"] == "Manhattan" }
manhattan_location = Location.new(latitude: 40.802286, longitude: -73.872615)
electronics_places << manhattan_location

bronx_location = electronics_results.find { |r| r["borough"] == "Bronx" }
bronx_location_location = Location.new(latitude: 40.802335, longitude: -73.872593)
electronics_places << bronx_location

queens_location = electronics_results.find { |r| r["borough"] == "Queens" }
queens_location = Location.new(latitude: 40.770826, longitude: -73.847093)
electronics_places << queens_location

brooklyn_location = electronics_results.find { |r| r["borough"] == "Brooklyn" }
brooklyn_location_location = Location.new(latitude: 40.590733, longitude: -73.996487)
electronics_places << brooklyn_location

staten_island_location = electronics_results.find { |r| r["borough"] == "Staten Island" }
staten_island_location = Location.new(latitude: 40.569979, longitude: -74.194595)
electronics_places << staten_island_location

electronics_places.each do |place|
	place.material_types << MaterialType.find_by(name: "electronics")
	place.save
end


end