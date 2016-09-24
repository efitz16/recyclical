class CreateMaterialTypesLocations < ActiveRecord::Migration[5.0]
  def change
    create_table    :material_types_locations do |t|
      t.references  :material_type
      t.references  :location
    end
  end
end
