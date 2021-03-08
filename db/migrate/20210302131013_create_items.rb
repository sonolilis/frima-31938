class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,                null: false
      t.integer :category_id,                null: false
      t.integer :price,                      null: false
      t.text :discription,                   null: false
      t.integer :status_id,                  null: false
      t.integer :shipping_id,                null: false
      t.integer :shipment_source_id,         null: false
      t.integer :date_of_shipment_id,        null: false
      t.references :user, foreign_key:true,  null: false, foreign_key: true

      t.timestamps
    end
  end
end