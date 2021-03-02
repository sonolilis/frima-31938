class Item < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_one    :purchase_history
  

end
