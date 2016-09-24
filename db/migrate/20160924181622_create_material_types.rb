class CreateMaterialTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :material_types do |t|
      t.string   :name, null: false

      t.timestamps null: false
    end
  end
end
