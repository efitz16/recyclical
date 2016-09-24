class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.float    :longitude, null: false
      t.float    :latitude, null: false
      t.text     :address

      t.timestamps null: false
    end
  end
end
