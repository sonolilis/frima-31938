class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order, foreign_key: true
      t.string :postnumber, null: false
      t.integer :shipment_source, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :buildingname
      t.string :phonenumber, null: false
      t.timestamps
    end
  end
end
