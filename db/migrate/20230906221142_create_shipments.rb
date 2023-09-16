class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references :order,null: false,foreign_key: true
      t.string :postal_code,null: false
      t.integer :prefecture_id,null: false
      t.string :city,null: false
      t.string :house_number,null: false
      t.string :building
      t.string :telephone,null: false


      t.timestamps
    end
  end
end
