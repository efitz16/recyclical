location ||= @location

json.id location.id
json.address location.address
json.coordinates do
  json.latitude location.latitude
  json.longitude location.longitude
end
json.material_types location.material_types.map { |material_type| material_type.name }

if location.class == ActiveRecord::Base && !location.persisted? &&
!location.valid?
  json.errors location.errors.messages
end
