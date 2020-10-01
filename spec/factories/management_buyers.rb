FactoryBot.define do
  factory :management_buyer do
    token { 123_456 }
    postal_code { '123-4567' }
    region_id { 14}
    city { '中野区' }
    address { '1-1' }
    building_name { '中野ハイツ' }
    phone_num {'09012345678'}
  end
end
