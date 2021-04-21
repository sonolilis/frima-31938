class OrderAdress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postnumber, :shipment_source_id, :municipality, :address, :buildingname, :phonenumber, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postnumber, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :shipment_source_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phonenumber, length: { maximum: 11 }, format: {with: /\A[0-9]*\z/, message: "Input only number"}
    validates :token
  end

  def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Address.create(order_id: order.id, postnumber: postnumber, shipment_source: shipment_source_id, municipality: municipality, address: address, buildingname: buildingname, phonenumber: phonenumber)
  end
end