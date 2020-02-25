class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :product, index: true, foreign_key: {on_delete: :cascade}
      t.integer :qty
      t.timestamps
    end
  end
end
