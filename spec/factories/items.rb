FactoryBot.define do
  factory :item do
    product_name  {Faker::Name.name}
    discription  {Faker::Lorem.sentence}
    category_id {2}
    status_id   {2}
    price       {1000}
    shipping_id {2}
    shipment_source_id   {2}
    date_of_shipment_id {2}
  
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('/Users/soukoike/projects/frima-31938/app/assets/images/test_image.jpg'), filename: 'test_image.jpeg')
    end
  end
end
