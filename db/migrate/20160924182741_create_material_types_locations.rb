class CreateMaterialTypesLocations < ActiveRecord::Migration[5.0]
  def change
    create_table    :locations_material_types do |t|
      t.references  :material_type
      t.references  :location
    end
  end
end
