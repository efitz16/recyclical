# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client = SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => ENV['DISPOSAL_NETWORKS']})

results = client.get("9m2c-n6wx", :$limit => 5000)

materials = ["food", "textiles", "clothing", "electronics"]

materials.each do |m|
  MaterialType.create(name: m)
end

results.each do |result|
  location = Location.new(latitude: result["location_1"]["coordinates"][0], longitude: result["location_1"]["coordinates"][0])
  location.material_type << MaterialType.where(name: "food")
end
