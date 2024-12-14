class AddBaseMaterialToMaterials < ActiveRecord::Migration[7.2]
  def change
    add_column :materials, :base_material_id, :bigint
  end
end
