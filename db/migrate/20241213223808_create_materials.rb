class CreateMaterials < ActiveRecord::Migration[7.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.references :recycler, null: false, foreign_key: true

      t.timestamps
    end
  end
end
