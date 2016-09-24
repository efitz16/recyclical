class Location < ApplicationRecord
  has_and_belongs_to_many :material_types
  after_validation :reverse_geocode unless :address
  validates :longitude, presence: true
  validates :latitude, presence: true

  reverse_geocoded_by :latitude, :longitude

end
