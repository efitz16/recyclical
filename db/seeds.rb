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
