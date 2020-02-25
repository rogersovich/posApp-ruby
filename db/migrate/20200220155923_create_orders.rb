class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :code
      t.date :tanggal
      t.integer :total_harga
      t.integer :total_bayar
      t.integer :kembalian
      t.timestamps
    end
  end
end
