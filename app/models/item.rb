class Item < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_one    :purchase_history
  has_one_attached :image
  

end
