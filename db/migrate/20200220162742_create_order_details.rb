class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :product, index: true, foreign_key: {on_delete: :cascade}
      t.references :order
      t.timestamps
    end
  end
end
