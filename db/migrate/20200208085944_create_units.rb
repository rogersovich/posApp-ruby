class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      
      t.references :category, index: true, foreign_key: {on_delete: :cascade}
      t.string :name
      t.timestamps
    end
  end
end
