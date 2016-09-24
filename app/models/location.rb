class Location < ApplicationRecord
  has_and_belongs_to_many :material_types
end
