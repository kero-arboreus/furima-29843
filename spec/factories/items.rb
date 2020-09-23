FactoryBot.define do
  factory :item do
    product_name { Faker::Movies::StarWars.droid }
    description { Faker::Lorem.sentence }
    value { 2000 }
    category_id { 2 }
    state_id { 2 }
    freight_id { 2 }
    shipment_region_id { 2 }
    shipdate_id { 2 }
    association :user
  end
end
