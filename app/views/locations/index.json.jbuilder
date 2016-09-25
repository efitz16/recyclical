json.locations @locations, partial: '/api/v1/locations/show', as: :location
json.current_location [:latitude, :longitude].zip(Geocoder.coordinates(params['zipcode'])).to_h
