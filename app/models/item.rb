class Item < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_one    :purchase_history
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :date_of_shipment

  with_options presence: true do
    validates :image
    validates :product_name
    validates :discription
    validates :category_id,  numericality: { other_than: 0 }
    validates :status_id, numericality: { other_than: 0 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: {with: /\A[0-9]+\z/}
    validates :shipment_source_id, numericality: { other_than: 0 }
    validates :shipping_id, numericality: { other_than: 0 }
    validates :date_of_shipment_id, numericality: { other_than: 0 }
    end

  def was_attached?
    self.image.attached?
  end
end