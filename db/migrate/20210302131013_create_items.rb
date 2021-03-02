class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.integer :category_id
      t.integer :price
      t.text :discription
      t.integer :status_id
      t.integer :shipping_id
      t.integer :shipment_source_id
      t.integer :date_of_shipment_id
      t.references :user, foreign_key:true

      t.timestamps
    end
  end
end
