FactoryBot.define do
  factory :order_adress do
    item_id { 1 }
    user_id { 1 }
    postnumber { '123-4567' }
    shipment_source_id { 1 }
    municipality {'横浜'}
    address { '1-1' }
    phonenumber { '12345678910' }
    buildingname { 'マンション名' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end