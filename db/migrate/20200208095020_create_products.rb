class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: {on_delete: :cascade}
      t.references :unit, index: true, foreign_key: {on_delete: :cascade}
      t.string :name
      t.integer :harga
      t.integer :stok
      t.integer :code
      t.timestamps
    end
  end
end
